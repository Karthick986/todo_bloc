import 'package:demo_test/what_todo/bloc/what_todo_bloc.dart';
import 'package:demo_test/what_todo/bloc/what_todo_events.dart';
import 'package:demo_test/what_todo/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUpdateDialog extends StatelessWidget {
  final TodoData? todoData;
  final bool isUpdate;
  final int index;

  const CreateUpdateDialog(
      {super.key, required this.isUpdate, this.todoData, required this.index});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    WhatTodoBloc whatTodoBloc = BlocProvider.of<WhatTodoBloc>(context);

    if (isUpdate) {
      textEditingController.text = todoData!.todoName;
    }

    return AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: "What todo..."),
          controller: textEditingController,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
            onPressed: () {
              if (textEditingController.text.isNotEmpty) {
                if (isUpdate) {
                  whatTodoBloc.add(UpdateTodoEvent(
                      todoData: TodoData(
                        todoId: todoData!.todoId,
                        todoName: textEditingController.text,
                      ),
                      index: index));
                } else {
                  whatTodoBloc.add(CreateTodoEvent(
                      todoData: TodoData(
                    todoId: index,
                    todoName: textEditingController.text,
                  )));
                }
              }
            },
            child: Text(isUpdate ? "Update" : "Create"))
      ],
    ));
  }
}
