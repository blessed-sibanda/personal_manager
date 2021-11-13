import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:personal_manager/data/managers/tasks_manager.dart';
import 'package:personal_manager/data/repositories/repository.dart';
import 'package:personal_manager/models/tasks_model.dart';
import 'package:personal_manager/utils.dart' as utils;
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    final tasksManager = Provider.of<TasksManager>(context, listen: false);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            tasksManager.addTask();
          },
        ),
        body: _buildTasksList(context));
  }

  Widget _buildTasksList(BuildContext context) {
    final repository = Provider.of<Repository>(context);
    final tasksManager = Provider.of<TasksManager>(context, listen: false);

    return StreamBuilder(
        stream: repository.watchAllTasks(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Task>> snapshot,
        ) {
          final tasks = snapshot.data;

          if (tasks == null) {
            return Container();
          }

          return ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = tasks[index];
                return Slidable(
                    key: ValueKey(task.id),
                    startActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {
                        repository.deleteTask(task);
                      }),
                      children: [
                        SlidableAction(
                          onPressed: (_) => repository.deleteTask(task),
                          backgroundColor: Theme.of(context).canvasColor,
                          foregroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Delete',
                        )
                      ],
                    ),
                    child: ListTile(
                      leading: Checkbox(
                          value: task.completed,
                          onChanged: (val) {
                            setState(() {
                              task.completed = val ?? task.completed;
                              repository.updateTask(task);
                            });
                          }),
                      title: Text(task.description,
                          style: task.completed
                              ? TextStyle(
                                  color: Theme.of(context).disabledColor)
                              : TextStyle(
                                  color: Theme.of(context).primaryColor)),
                      subtitle: Text(utils.formatDate(task.dueDate),
                          style: task.completed
                              ? TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  decoration: TextDecoration.lineThrough)
                              : TextStyle(
                                  color: Theme.of(context).primaryColor)),
                      onTap: () {
                        tasksManager.editTask(task.id!);
                      },
                    ));
              });
        });
  }
}
