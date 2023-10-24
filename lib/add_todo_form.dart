import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_customizer/theme.dart' as Theme;

class AddTodoForm extends StatelessWidget {
  const AddTodoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add TODO'),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10), labelText: "Title"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10), labelText: "Hours"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: TextField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        labelText: "Minutes"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Go back!'),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Center(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Theme.green)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
