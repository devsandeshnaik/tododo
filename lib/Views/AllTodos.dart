import 'package:flutter/material.dart';
import '../Model/Todo.dart';

class AllTodos extends StatefulWidget {
  final List<Todo> todoList;

  AllTodos(this.todoList);

  _AllTodos createState() => _AllTodos();
}

class _AllTodos extends State<AllTodos> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) {
        var task = widget.todoList[index];
        return ListTile(
          title: Text(task.title),
          trailing: Icon(
            Icons.star,
            color: task.isHigPriority ? Colors.red : Colors.red[100],
          ),
          onTap: () {
            setState(() {
              task.isHigPriority = task.isHigPriority ? false : true;
            });
          },
        );
      },
    );
  }
}
