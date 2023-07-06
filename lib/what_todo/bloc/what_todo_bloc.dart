import 'package:demo_test/what_todo/bloc/what_todo_events.dart';
import 'package:demo_test/what_todo/bloc/what_todo_states.dart';
import 'package:demo_test/what_todo/model/todo_model.dart';
import 'package:demo_test/what_todo/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhatTodoBloc extends Bloc<WhatTodoEvents, WhatTodoStates> {
  WhatTodoStates get todoInitialState => WhatTodoInitialState();
  TodoRepository todoRepository;

  WhatTodoBloc({required this.todoRepository}) : super(WhatTodoInitialState()) {
    on<GetTodoEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        WhatTodoModel whatTodoModel = await todoRepository.getTodos();
        emit(GetTodoLoadedState(whatTodoModel: whatTodoModel));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });

    on<CreateTodoEvent>((event, emit) {
      emit(TodoLoadingState());
      try {
        emit(CreateTodoLoadedState(todoData: event.todoData));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });

    on<UpdateTodoEvent>((event, emit) {
      emit(TodoLoadingState());
      try {
        emit(UpdateTodoLoadedState(todoData: event.todoData,
        index: event.index));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });

    on<DeleteTodoEvent>((event, emit) {
      emit(TodoLoadingState());
      try {
        emit(DeleteTodoLoadedState(index: event.todoIndex));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });
  }

  void showSnackBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)));
  }
}