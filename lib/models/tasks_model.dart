import 'package:intl/intl.dart';

extension on DateTime {
  String get formatted {
    return DateFormat.yMMMEd('en_US').format(toLocal());
  }
}

class Task {
  int? id;
  String description;
  DateTime dueDate;
  bool completed;

  Task(
      {this.id,
      required this.dueDate,
      this.description = '',
      this.completed = false});

  factory Task.fromMap(Map<String, dynamic> taskMap) => Task(
        id: taskMap['id'],
        dueDate: taskMap['dueDate'],
        description: taskMap['description'],
        completed: taskMap['completed'] as int == 1 ? true : false,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'dueDate': dueDate.formatted,
        'description': description,
        'completed': completed == true ? 1 : 0,
      };
}
