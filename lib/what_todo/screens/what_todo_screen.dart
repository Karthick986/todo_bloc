import 'package:demo_test/what_todo/bloc/what_todo_bloc.dart';
import 'package:demo_test/what_todo/bloc/what_todo_events.dart';
import 'package:demo_test/what_todo/bloc/what_todo_states.dart';
import 'package:demo_test/what_todo/model/todo_model.dart';
import 'package:demo_test/what_todo/screens/widgets/create_update_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhatTodoScreen extends StatelessWidget {
  const WhatTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WhatTodoBloc whatTodoBloc = BlocProvider.of(context);
    whatTodoBloc.add(GetTodoEvent());
    List<WhatTodoModel> whatTodoList = [];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("What ToDO"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => BlocProvider.value(
                  value: whatTodoBloc,
                  child: CreateUpdateDialog(
                    isUpdate: false,
                    index: whatTodoList.length + 1,
                  )));
        },
      ),
      body: SafeArea(
          child: BlocConsumer<WhatTodoBloc, WhatTodoStates>(
        listener: (BuildContext context, WhatTodoStates state) {
          if (state is GetTodoLoadedState) {
            whatTodoList = state.whatTodoModel;
          }
          if (state is CreateTodoLoadedState) {
            Navigator.pop(context);
            whatTodoList.add(state.whatTodoModel);
          }
          if (state is UpdateTodoLoadedState) {
            Navigator.pop(context);
            whatTodoList[state.index] = state.whatTodoModel;
          }
          if (state is DeleteTodoLoadedState) {
            whatTodoList.removeAt(state.index);
          }
        },
        builder: (BuildContext buildContext, WhatTodoStates state) {
          if (state is TodoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return whatTodoList.isNotEmpty ? ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "${index + 1}. ${whatTodoList[index].todoName}",
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    whatTodoBloc.add(DeleteTodoEvent(todoIndex: index));
                  },
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => BlocProvider.value(
                          value: whatTodoBloc,
                          child: CreateUpdateDialog(
                            isUpdate: true,
                            whatTodoModel: whatTodoList[index],
                            index: index,
                          )));
                },
              );
            },
            itemCount: whatTodoList.length,
          ) :
          const Center(child: Text("Nothing to do"),);
        },
      )),
    );
  }
}
