import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {}

class GetTodosEvent extends TodoEvents {
  @override
  List<Object?> get props => throw UnimplementedError();
}