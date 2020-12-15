import 'package:flutter/Material.dart';
import 'package:tododo/Views/PriorityTodo.dart';
import '../Model/Todo.dart';
import 'AllTodos.dart';

class Homepage extends StatefulWidget {
  final List<Todo> todoTasks = [];
  //ignore: must_be_immutable
  int _selectedIndex = 0;
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDoDo",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24)),
        actions: [
          FlatButton(
              child: Icon(Icons.add, color: Colors.white, size: 23),
              onPressed: () {
                _addNewTodo();
              })
        ],
      ),
      body: _getViewFor(widget._selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('All Todo\'s')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.red),
              title: Text('Priorities'))
        ],
        currentIndex: widget._selectedIndex,
        onTap: (index) {
          setState(() {
            widget._selectedIndex = index;
          });
        },
      ),
    );
  }

  _addNewTodo() {
    final myController = TextEditingController();
    var okAction = FlatButton(
      child: Text("OK"),
      onPressed: () {
        if (myController.text.length > 0) {
          var task = Todo(myController.text);
          setState(() {
            widget.todoTasks.add(task);
          });
          Navigator.of(context).pop();
        }
      },
    );

    var cancelAction = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter the task"),
            content: TextField(
              controller: myController,
            ),
            actions: [cancelAction, okAction],
          );
        });
  }

  List<Todo> _getPriorityTasks() {
    return widget.todoTasks.where((todo) => todo.isHigPriority).toList();
  }

  Widget _getViewFor(int index) {
    switch (index) {
      case 0:
        return AllTodos(widget.todoTasks);
        break;
      case 1:
        return PriorityTodo(_getPriorityTasks());
        break;
      default:
        return SizedBox.shrink();
        break;
    }
  }
}
