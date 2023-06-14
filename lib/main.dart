import 'package:demo_test/todo/bloc/todo_bloc.dart';
import 'package:demo_test/todo/repository/todo_repository.dart';
import 'package:demo_test/todo/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoBloc(todoRepository: TodoRepositoryImpl()),
        child: const TodoListScreen(),
      ),
    );
  }
}
