abstract class TodoEvent {}

class AddTask extends TodoEvent {
  final String title;
  AddTask(this.title);
}

class ToggleTask extends TodoEvent {
  final String id;
  ToggleTask(this.id);
}

class EditTask extends TodoEvent {
  final String id;
  final String newTitle;
  EditTask({required this.id, required this.newTitle});
}

class DeleteTask extends TodoEvent {
  final String id;
  DeleteTask(this.id);
}

class ClearAllTasks extends TodoEvent {

}