class Todo {
  String title;
  bool isHigPriority = false;
  Todo(this.title, {this.isHigPriority = false});

  Map<String, dynamic> toJson() {
    return {'title': title, 'priority': isHigPriority};
  }

  Todo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isHigPriority = json['priority'];
  }
}
