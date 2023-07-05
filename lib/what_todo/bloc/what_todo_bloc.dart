import 'package:demo_test/what_todo/bloc/what_todo_events.dart';
import 'package:demo_test/what_todo/bloc/what_todo_states.dart';
import 'package:demo_test/what_todo/model/todo_model.dart';
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
        emit(DeleteTodoLoadedState(message: "Deleted successfully",
            index: event.todoIndex));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });
  }

  List<WhatTodoModel> getDefaultTodoList() {
    return [
      WhatTodoModel(todoId: 1, todoName: "Wake up @7pm"),
      WhatTodoModel(todoId: 2, todoName: "Breakfast after brush"),
      WhatTodoModel(todoId: 3, todoName: "Read books"),
      WhatTodoModel(todoId: 4, todoName: "Start work"),
    ];
  }
}