import 'Todo.dart';
import '../Helpers/Constants.dart';
import '../Helpers/FileManger.dart';

import 'dart:convert';

class TodoListManager {
  static addItem(List<Todo> to, Todo item) async {
    to.add(item);
    var json = jsonEncode(to);
    FileManager().saveStringToFile(Constants.todoTasksListFileName, json);
  }

  static Future<List<Todo>> getTasks() async {
    String tasks =
        await FileManager().readStringFrom(Constants.todoTasksListFileName);
    List<dynamic> json = jsonDecode(tasks);
    List<Todo> todoTasks = [];
    json.forEach((element) {
      todoTasks.add(Todo.fromJson(element));
    });
    return todoTasks;
  }
}
