import 'package:demo_test/what_todo/model/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class WhatTodoEvents extends Equatable {}

class GetTodoEvent extends WhatTodoEvents {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CreateTodoEvent extends WhatTodoEvents {
  final WhatTodoModel whatTodoModel;

  CreateTodoEvent({required this.whatTodoModel});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateTodoEvent extends WhatTodoEvents {
  final int index;
  final WhatTodoModel whatTodoModel;

  UpdateTodoEvent({required this.whatTodoModel,
    required this.index});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteTodoEvent extends WhatTodoEvents {
  final int todoIndex;

  DeleteTodoEvent({required this.todoIndex});
  @override
  List<Object?> get props => throw UnimplementedError();
}