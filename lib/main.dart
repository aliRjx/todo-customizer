import 'package:flutter/material.dart';
import 'package:todo_customizer/add_todo_form.dart';
import 'package:todo_customizer/todo.dart';

void main() {
  return runApp(const MaterialApp(
    home: TodoCustomizer(),
  ));
}

class TodoCustomizer extends StatefulWidget {
  const TodoCustomizer({super.key});

  @override
  State<TodoCustomizer> createState() => _TodoCustomizerState();
}

class _TodoCustomizerState extends State<TodoCustomizer> {
  List todos = [
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
  Future<void> _navigateResult(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTodoForm()),
    );

    if (!mounted || result == null) return;
    todos.add({
      "title": result["title"],
      "total_hour": result["hour"],
      "total_min": result["min"],
      "spent_hour": 0,
      "spent_min": 0,
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO Customizer"),
      ),
      body: Column(children: [
        for (int i = 0; i < todos.length; i++)
          Todo(
            todo: todos[i],
            updateTodo: (newValue) {
              todos[i] = newValue;
              setState(() {});
            },
            index: i,
          )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateResult(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
