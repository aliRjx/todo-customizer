import 'package:flutter/material.dart';
import 'package:todo_customizer/todo.dart';

void main() {
  return runApp(TodoCustomizer());
}

class TodoCustomizer extends StatelessWidget {
  TodoCustomizer({super.key});

  final List todos = [
    {
      "percent": 0.3,
      "spent": "1h 20min",
      "title": "idk",
      "total": "2h 40min",
    },
    {
      "percent": 0.3,
      "spent": "1h 20min",
      "title": "idk",
      "total": "2h 40min",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("TODO Customizer"),
          ),
          body: Column(
            children: todos
                .map((todo) => Todo(
                    title: todo["title"],
                    spent: todo["spent"],
                    total: todo["total"],
                    percent: todo["percent"]))
                .toList(),
          )),
    );
  }
}
