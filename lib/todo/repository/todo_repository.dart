import 'dart:convert';
import 'package:demo_test/todo/model/get_todo_model.dart';
import 'package:http/http.dart' as http;

abstract class TodoRepository {
  Future<GetTodosModel> getTodos();
}

class TodoRepositoryImpl implements TodoRepository {

  @override
  Future<GetTodosModel> getTodos() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    return GetTodosModel.fromJson(jsonDecode(response.body));
  }
}