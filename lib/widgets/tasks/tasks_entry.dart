import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_manager/data/managers/tasks_manager.dart';
import 'package:personal_manager/data/repositories/repository.dart';
import 'package:provider/provider.dart';
import 'package:personal_manager/models/tasks_model.dart';
import 'package:personal_manager/utils.dart' as utils;

class TasksEntry extends StatefulWidget {
  const TasksEntry({Key? key}) : super(key: key);

  @override
  _TasksEntryState createState() => _TasksEntryState();
}

class _TasksEntryState extends State<TasksEntry> {
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final Task _task = Task(dueDate: DateTime.now());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final repository = Provider.of<Repository>(context, listen: false);
      final tasksManager = Provider.of<TasksManager>(context, listen: false);
      if (tasksManager.selectedId != null) {
        repository.findTaskById(tasksManager.selectedId!).then((value) {
          _descriptionController.text = value.description;
          _task.id = value.id;
        });
      }
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return Consumer<TasksManager>(builder: (context, tasksManager, child) {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            children: [
              TextButton(
                  onPressed: () => tasksManager.resetScreen(),
                  child: const Text('Cancel')),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    String _successText = 'Task Saved';
                    _task.description = _descriptionController.text;

                    if (tasksManager.selectedId == null) {
                      repository.insertTask(_task);
                    } else {
                      repository.updateTask(_task);
                      _successText = 'Task Updated';
                    }
                    tasksManager.savedTask();
                    tasksManager.resetScreen();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Text(_successText),
                        backgroundColor: Colors.grey,
                      ),
                    );
                  },
                  child: const Text('Save')),
            ],
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(children: [
            ListTile(
              leading: const Icon(Icons.content_paste),
              title: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: const InputDecoration(hintText: 'Description'),
                controller: _descriptionController,
                validator: (String? value) {
                  if (value!.isEmpty) return 'Please enter description';
                  return null;
                },
              ),
            ),
            ListTile(
              title: const Text('Due Date'),
              subtitle: Text(utils.formatDate(_task.dueDate)),
              trailing: IconButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() => _task.dueDate = pickedDate);
                    }
                  },
                  icon: const Icon(Icons.edit),
                  color: Theme.of(context).primaryColor),
            ),
          ]),
        ),
      );
    });
  }
}
