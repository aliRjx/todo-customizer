import 'package:flutter/material.dart';
import 'package:todo_customizer/theme.dart' as Theme;

class Todo extends StatelessWidget {
  final String title, spent, total;
  final double percent;
  Todo(
      {super.key,
      required this.title,
      required this.spent,
      required this.total,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Theme.red,
                  fontSize: Theme.titleSize,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              height: 20,
              child: LinearProgressIndicator(
                value: percent,
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text("${spent} / ${total}"),
            ),
          ],
        ),
      ],
    );
  }
}
