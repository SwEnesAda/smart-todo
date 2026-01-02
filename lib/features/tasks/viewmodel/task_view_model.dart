import 'package:flutter/material.dart';
import '../model/task.dart' show Task;

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.removeWhere((t) => t.taskId == task.taskId);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((t) => t.taskId == updatedTask.taskId);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void toggleTask(Task task) {
    updateTask(task.copyWith(isCompleted: !task.isCompleted));
  }
}
