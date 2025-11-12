import '../models/task.dart';

class TodoState {
  final List<Task> tasks;

  const TodoState({this.tasks = const []});

  TodoState copyWith({List<Task>? tasks}) {
    return TodoState(tasks: tasks ?? this.tasks);
  }
}