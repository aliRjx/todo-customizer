import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_customizer/themes/theme.dart' as theme;

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({super.key});

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? title = "";
  int hour = 0, min = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add TODO'),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  onChanged: (value) {
                    title = value;
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Title",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) {
                        hour = int.tryParse(value)!;
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Hours"),
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
                    child: TextFormField(
                      onChanged: (value) {
                        min = int.tryParse(value)!;
                      },
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Go back!'),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(theme.green)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (min > 59) {
                            hour += (min / 60).floor();
                            min = min % 60;
                          } else if (hour == 0 && min == 0) {
                            hour = 1;
                          }
                          Navigator.pop(context,
                              {"title": title, "hour": hour, "min": min});
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
