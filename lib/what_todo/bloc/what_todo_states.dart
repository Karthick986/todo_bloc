import 'package:demo_test/what_todo/model/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class WhatTodoStates extends Equatable {}

class WhatTodoInitialState extends WhatTodoStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TodoLoadingState extends WhatTodoStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetTodoLoadedState extends WhatTodoStates {
  final WhatTodoModel whatTodoModel;

  GetTodoLoadedState({required this.whatTodoModel});

  @override
  List<Object?> get props => [whatTodoModel];
}

class CreateTodoLoadedState extends WhatTodoStates {
  final TodoData todoData;

  CreateTodoLoadedState({required this.todoData});

  @override
  List<Object?> get props => [todoData];
}

class UpdateTodoLoadedState extends WhatTodoStates {
  final int index;
  final TodoData todoData;

  UpdateTodoLoadedState({required this.todoData, required this.index});

  @override
  List<Object?> get props => [index, todoData];
}

class DeleteTodoLoadedState extends WhatTodoStates {
  final int index;

  DeleteTodoLoadedState({required this.index});

  @override
  List<Object?> get props => [index];
}

class TodoErrorState extends WhatTodoStates {
  final String message;

  TodoErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
