import 'package:hive_flutter/hive_flutter.dart';

class HiveDataBase {
  final _myBox = Hive.box("todo_db");
  void saveData(List todos) {
    List<List<dynamic>> allFormattedTodos = [];
    for (var todo in todos) {
      List<dynamic> formattedTodo = [
        todo["title"],
        todo["total_hour"],
        todo["total_min"],
        todo["spent_hour"],
        todo["spent_min"],
      ];
      allFormattedTodos.add(formattedTodo);
    }

    _myBox.put("ALL_TODOS", allFormattedTodos);
  }

  List readData() {
    List savedTodos = _myBox.get("ALL_TODOS") ?? [];
    List allTodos = [];
    for (int i = 0; i < savedTodos.length; i++) {
      String title = savedTodos[i][0];
      int total_hour = savedTodos[i][1];
      int total_min = savedTodos[i][2];
      int spent_hour = savedTodos[i][3];
      int spent_min = savedTodos[i][4];
      allTodos.add({
        "title": title,
        "total_hour": total_hour,
        "total_min": total_min,
        "spent_hour": spent_hour,
        "spent_min": spent_min
      });
    }
    return allTodos;
  }
}
