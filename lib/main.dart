import 'package:flutter/material.dart';
import 'package:todo_customizer/add_todo_form.dart';
import 'package:todo_customizer/todo.dart';

void main() {
  return runApp(MaterialApp(
    home: TodoCustomizer(),
  ));
}

class TodoCustomizer extends StatefulWidget {
  TodoCustomizer({super.key});

  @override
  State<TodoCustomizer> createState() => _TodoCustomizerState();
}

class _TodoCustomizerState extends State<TodoCustomizer> {
  final List todos = [
    {
      "title": "idk",
      "total_hour": 2,
      "total_min": 40,
      "spent_hour": 1,
      "spent_min": 20
    },
    {
      "title": "idk2",
      "total_hour": 6,
      "total_min": 40,
      "spent_hour": 1,
      "spent_min": 20
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO Customizer"),
      ),
      body: Column(
        children: todos
            .map(
              (todo) => Todo(
                title: todo["title"],
                spent: '${todo["spent_hour"]}h ${todo["spent_min"]}m',
                total: '${todo["total_hour"]}h ${todo["total_min"]}m',
                percent: (todo["spent_hour"] * 60 + todo["spent_min"]) /
                    (todo["total_hour"] * 60 + todo["total_min"]),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
