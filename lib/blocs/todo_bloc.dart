import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import 'package:uuid/uuid.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final _uuid = const Uuid();

  TodoBloc() : super(const TodoState()) {
    on<AddTask>((event, emit) {
      final newTask = Task(id: _uuid.v4(), title: event.title);
      emit(state.copyWith(tasks: [...state.tasks, newTask]));
    });

    on<ToggleTask>((event, emit) {
      final updatedTasks = state.tasks.map((task) {
        return task.id == event.id ? task.copyWith(isDone: !task.isDone) : task;
      }).toList();
      emit(state.copyWith(tasks: updatedTasks));
    });

    on<EditTask>((event, emit) {
      final updatedTasks = state.tasks.map((task) {
        return task.id == event.id
            ? task.copyWith(title: event.newTitle)
            : task;
      }).toList();
      emit(state.copyWith(tasks: updatedTasks));
    });

    on<DeleteTask>((event, emit) {
      emit(
        state.copyWith(
          tasks: state.tasks.where((task) => task.id != event.id).toList(),
        ),
      );
    });

    on<ClearAllTasks>((event, emit) {
      emit(state.copyWith(tasks: []));
    });
  }
}
