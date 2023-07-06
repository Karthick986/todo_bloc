import 'dart:convert';

import 'package:demo_test/what_todo/model/todo_model.dart';
import 'package:http/http.dart' as http;

abstract class TodoRepository {
  Future<WhatTodoModel> getTodos();
}

class WhatTodoRepository extends TodoRepository {
  @override
  Future<WhatTodoModel> getTodos() async {
    final response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Karthick986/todo_bloc/main/todo.json"));
    return WhatTodoModel.fromJson(jsonDecode(response.body));
  }
}
