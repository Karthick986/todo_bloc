import 'package:demo_test/todo/bloc/todo_bloc.dart';
import 'package:demo_test/todo/bloc/todo_events.dart';
import 'package:demo_test/todo/bloc/todo_states.dart';
import 'package:demo_test/todo/model/get_todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen>
    with SingleTickerProviderStateMixin {
  TodoBloc? todoBloc;
  List<GetTodoData> getTodoData = [];
  List<GetTodoData> filterTodoData = [];
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    todoBloc = BlocProvider.of<TodoBloc>(context);
    todoBloc!.add(GetTodosEvent());
    tabController = TabController(length: 2, vsync: this);

    tabController!.addListener(() {
      if (!tabController!.indexIsChanging) {
        setState(() {
          filterTodoData.clear();
          filterTodoData = todoBloc!.sortTodoData(getTodoData, tabController!.index);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Display todo's in flutter bloc"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight * 0.5),
            child: DefaultTabController(
              length: 3,
              child: TabBar(
                tabs: const [
                  Tab(child: Text("Pending")),
                  Tab(child: Text("Completed"))
                ],
                controller: tabController,
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: List.generate(2, (index) =>
          tabController!.index == index ?
              BlocConsumer<TodoBloc, TodoStates>(
            listener: (BuildContext context, TodoStates state) {
              if (state is GetTodoLoadedState) {
                if (state.getTodosModel.getTodoData != null) {
                  setState(() {
                    getTodoData = state.getTodosModel.getTodoData!;
                    filterTodoData = todoBloc!.sortTodoData(getTodoData, tabController!.index);
                  });
                }
              }
            },
            builder: (BuildContext context, TodoStates state) {
              if (state is GetTodoLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetTodoLoadedState) {
                return filterTodoData.isNotEmpty
                    ? Scrollbar(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            "${filterTodoData[index].id}. ",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Flexible(
                            child: Text(
                                filterTodoData[index].title.toString(),
                                style: const TextStyle(fontSize: 18),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 16,
                      );
                    },
                    itemCount: filterTodoData.length,
                  ),
                )
                    : const Center(
                  child: Text("No Data Available!"),
                );
              } else if (state is GetTodoErrorState) {
                return Center(child: Text(state.message.toString()));
              } else {
                return Container();
              }
            },
          ) :
            Center(child: CircularProgressIndicator(),),)
        ));
  }
}
