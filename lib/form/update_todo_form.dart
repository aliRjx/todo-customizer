import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_customizer/themes/theme.dart' as theme;

class UpdateTodoForm extends StatefulWidget {
  final Map todo;
  const UpdateTodoForm({super.key, required this.todo});

  @override
  State<UpdateTodoForm> createState() => _UpdateTodoFormState();
}

class _UpdateTodoFormState extends State<UpdateTodoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? title = widget.todo["title"];
    int? hour = widget.todo["total_hour"], min = widget.todo["total_min"];
    int? spentHour = 0, spentMin = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update TODO'),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Update TODO Data",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Flexible(
                child: TextFormField(
                  onChanged: (value) {
                    title = value;
                  },
                  initialValue: title,
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
                        hour = int.tryParse(value);
                      },
                      initialValue: hour.toString(),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Total Hours"),
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
                        min = int.tryParse(value);
                      },
                      initialValue: min.toString(),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Total Minutes"),
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
              const Text("Add to Spent Time",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                "Current spent time: ${widget.todo["spent_hour"]}h ${widget.todo["spent_min"]}m",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) {
                        spentHour = int.tryParse(value);
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
                        spentMin = int.tryParse(value);
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
                          int sm = widget.todo["spent_min"] + spentMin;
                          int sh = widget.todo["spent_hour"] + spentHour;
                          if (sm > 59) {
                            sh += (sm / 60).floor();
                            sm = sm % 60;
                          }
                          Navigator.pop(context, {
                            "title": title,
                            "total_hour": hour,
                            "total_min": min,
                            "spent_hour": sh,
                            "spent_min": sm,
                          });
                        }
                      },
                      child: const Text('Update'),
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
