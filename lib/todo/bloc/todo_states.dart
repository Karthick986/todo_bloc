import 'package:demo_test/todo/model/get_todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodoStates extends Equatable {}

class TodoInitialState extends TodoStates {
  @override
  List<Object?> get props => [];
}

class GetTodoLoadingState extends TodoStates {
  @override
  List<Object?> get props => [];
}

class GetTodoLoadedState extends TodoStates {
  final GetTodosModel getTodosModel;

  GetTodoLoadedState({required this.getTodosModel});
  @override
  List<Object?> get props => [];
}

class GetTodoErrorState extends TodoStates {
  final String message;
  GetTodoErrorState({required this.message});
  @override
  List<Object?> get props => [];
}