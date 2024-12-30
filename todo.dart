//Todo
class Todo {
  String? id;
  String? todotext;
  late bool isDone;

  Todo({
    required this.id,
    required this.todotext,
    this.isDone = false,
  });

  static List<Todo> todo_item() {
    return [
      Todo(id: '1', todotext: 'Prepare for technical interview', isDone: false),
      Todo(id: '2', todotext: 'Update LinkedIn profile', isDone: true),
      Todo(id: '3', todotext: 'Research company background', isDone: false),
      Todo(id: '4', todotext: 'Practice coding challenges', isDone: true),
      Todo(id: '5', todotext: 'Revise Flutter and Dart concepts', isDone: false),
      Todo(id: '6', todotext: 'Organize project portfolio', isDone: true),
      Todo(id: '7', todotext: 'Plan mock interview session', isDone: false),
      Todo(id: '8', todotext: 'Prepare answers for common HR questions', isDone: false),
    ];
  }

}
