import 'package:flutter/material.dart';
import 'package:personal_manager/data/managers/tasks_manager.dart';
import 'package:personal_manager/widgets/tasks/tasks_entry.dart';
import 'package:personal_manager/widgets/tasks/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  final pages = const [TasksList(), TasksEntry()];

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksManager>(builder: (context, tasksManager, child) {
      final index = tasksManager.screen;
      return pages[index];
    });
  }
}
