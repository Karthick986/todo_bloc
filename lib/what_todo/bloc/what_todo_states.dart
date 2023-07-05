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
  final List<WhatTodoModel> whatTodoModel;

  GetTodoLoadedState({required this.whatTodoModel});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class CreateTodoLoadedState extends WhatTodoStates {
  final WhatTodoModel whatTodoModel;
  CreateTodoLoadedState({required this.whatTodoModel});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateTodoLoadedState extends WhatTodoStates {
  final int index;
  final WhatTodoModel whatTodoModel;
  UpdateTodoLoadedState({required this.whatTodoModel, required this.index});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteTodoLoadedState extends WhatTodoStates {
  final int index;
  final String message;
  DeleteTodoLoadedState({required this.message, required this.index});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class TodoErrorState extends WhatTodoStates {
  final String message;
  TodoErrorState({required this.message});

  @override
  List<Object?> get props => throw UnimplementedError();
}