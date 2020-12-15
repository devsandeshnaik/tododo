import 'package:flutter/Material.dart';
import '../Model/Todo.dart';

class PriorityTodo extends StatelessWidget {
  final List<Todo> todoList;

  PriorityTodo(this.todoList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        var task = todoList[index];
        return ListTile(
          title: Text(task.title),
          trailing: Icon(
            Icons.star,
            color: task.isHigPriority ? Colors.red : Colors.red[100],
          ),
        );
      },
    );
  }
}
