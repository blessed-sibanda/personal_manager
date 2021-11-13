import 'package:personal_manager/models/tasks_model.dart';

abstract class TasksRepository {
  Future<List<Task>> findAllTasks();
  Future<Task> findTaskById(int id);
  Stream<List<Task>> watchAllTasks();
  Future<int> insertTask(Task task);
  Future<dynamic> updateTask(Task task);
  Future<void> deleteTask(Task task);
}
