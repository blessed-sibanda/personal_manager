class Task {
  int? id;
  String description;
  DateTime? dueDate;
  bool completed;

  Task({
    this.id,
    required this.dueDate,
    this.description = '',
    this.completed = false,
  });
}
