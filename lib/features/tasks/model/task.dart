// MY TASK MODEL

class Task {
  final String taskId;
  final String title;
  final bool isCompleted;

  Task({required this.taskId, required this.title, required this.isCompleted});

  Task copyWith({String? taskId, String? title, bool? isCompleted}) {
    return Task(
      taskId: taskId ?? this.taskId,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
