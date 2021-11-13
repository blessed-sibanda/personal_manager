import 'package:personal_manager/data/moor/moor_db.dart';
import 'package:personal_manager/data/repositories/tasks_repository.dart';
import 'package:personal_manager/models/tasks_model.dart';

class TasksMoorRepository implements TasksRepository {
  final TaskDao _taskDao = PersonalManagerDatabase().taskDao;

  Stream<List<Task>>? tasksStream;

  @override
  Future<void> deleteTask(Task task) {
    return _taskDao.deleteTask(task.id!);
  }

  @override
  Future<List<Task>> findAllTasks() {
    return _taskDao.findAllTasks().then((List<MoorTaskData> moorTasks) {
      final tasks = <Task>[];
      for (var moorTask in moorTasks) {
        final task = moorTaskToTask(moorTask);
        tasks.add(task);
      }
      return tasks;
    });
  }

  @override
  Future<Task> findTaskById(int id) {
    return _taskDao
        .findTaskById(id)
        .then((listOfTasks) => moorTaskToTask(listOfTasks.first));
  }

  @override
  Future<int> insertTask(Task task) {
    return _taskDao.insertTask(taskToInsertableMoorTask(task));
  }

  @override
  Future<bool> updateTask(Task task) {
    return _taskDao.updateTask(taskToInsertableMoorTask(task));
  }

  @override
  Stream<List<Task>> watchAllTasks() {
    tasksStream ??= _taskDao.watchAllTasks();
    return tasksStream!;
  }
}
