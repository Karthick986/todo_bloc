import 'package:demo_test/what_todo/bloc/what_todo_bloc.dart';
import 'package:demo_test/what_todo/repository/todo_repository.dart';
import 'package:demo_test/what_todo/screens/what_todo_screen.dart';
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
      title: 'Todo page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WhatTodoBloc(todoRepository: WhatTodoRepository()),
        child: const WhatTodoScreen(),
      ),
    );
  }
}
