import 'package:demo_test/todo/bloc/todo_events.dart';
import 'package:demo_test/todo/bloc/todo_states.dart';
import 'package:demo_test/todo/model/get_todo_model.dart';
import 'package:demo_test/todo/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates> {
  TodoRepository todoRepository;

  TodoStates get initialState => TodoInitialState();

  TodoBloc({required this.todoRepository}) : super(TodoInitialState()) {
    on<GetTodosEvent>((event, emit) async {
      emit(GetTodoLoadingState());
      try {
        GetTodosModel getTodosModel = await todoRepository.getTodos();
        if (getTodosModel.getTodoData != null) {
          emit(GetTodoLoadedState(getTodosModel: getTodosModel));
        } else {
          emit(GetTodoErrorState(message: "Something went wrong!"));
        }
      } catch (e) {
        emit(GetTodoErrorState(message: e.toString()));
        debugPrint(e.toString());
      }
    });
  }

  List<GetTodoData> sortTodoData(List<GetTodoData> todoList, int index) {
    return todoList.where((element) => element.completed == (index==0) ? false : true).toList();
  }
}