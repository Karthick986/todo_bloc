import 'package:demo_test/what_todo/bloc/what_todo_events.dart';
import 'package:demo_test/what_todo/bloc/what_todo_states.dart';
import 'package:demo_test/what_todo/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhatTodoBloc extends Bloc<WhatTodoEvents, WhatTodoStates> {
  WhatTodoStates get todoInitialState => WhatTodoInitialState();

  WhatTodoBloc() : super(WhatTodoInitialState()) {
    on<GetTodoEvent>((event, emit) {
      emit(TodoLoadingState());
      try {
        List<WhatTodoModel> whatTodoList = getDefaultTodoList();
        emit(GetTodoLoadedState(whatTodoModel: whatTodoList));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });

    on<CreateTodoEvent>((event, emit) {
      emit(TodoLoadingState());
      try {
        emit(CreateTodoLoadedState(whatTodoModel: event.whatTodoModel));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });

    on<UpdateTodoEvent>((event, emit) {
      emit(TodoLoadingState());
      try {
        emit(UpdateTodoLoadedState(whatTodoModel: event.whatTodoModel,
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

  List<WhatTodoModel> getDefaultTodoList() {
    return [
      WhatTodoModel(todoId: 1, todoName: "Plan next day before sleep"),
      WhatTodoModel(todoId: 2, todoName: "Wakeup early"),
      WhatTodoModel(todoId: 3, todoName: "Read a book"),
      WhatTodoModel(todoId: 4, todoName: "Start routine work"),
    ];
  }

  void showSnackBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)));
  }
}