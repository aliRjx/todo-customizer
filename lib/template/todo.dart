import 'package:flutter/material.dart';
import 'package:todo_customizer/themes/theme.dart' as theme;
import 'package:todo_customizer/form/update_todo_form.dart';

class Todo extends StatelessWidget {
  final Map todo;
  final Function updateTodo;
  final int index;
  const Todo(
      {super.key,
      required this.todo,
      required this.updateTodo,
      required this.index});

  Future<void> _navigateResult(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateTodoForm(todo: todo)),
    );
    if (result == null) return;

    updateTodo(result);
  }

  @override
  Widget build(BuildContext context) {
    final percent = (todo["spent_hour"] * 60 + todo["spent_min"]) /
        (todo["total_hour"] * 60 + todo["total_min"]);
    return InkWell(
      onTap: () {
        _navigateResult(context);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  todo["title"],
                  style: TextStyle(
                    color: percent < 1 ? theme.red : theme.green,
                    fontSize: theme.titleSize,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              SizedBox(
                height: 20,
                child: LinearProgressIndicator(
                  value: percent,
                  backgroundColor: Colors.white,
                  valueColor: percent < 0.25
                      ? const AlwaysStoppedAnimation<Color>(theme.red)
                      : percent < 0.50
                          ? const AlwaysStoppedAnimation<Color>(theme.orange)
                          : percent < 1
                              ? const AlwaysStoppedAnimation<Color>(
                                  theme.yellow)
                              : const AlwaysStoppedAnimation<Color>(
                                  theme.green),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                    "${todo['spent_hour']}h ${todo['spent_min']}m / ${todo['total_hour']}h ${todo['total_min']}m"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
