import 'package:personal_manager/data/repositories/tasks_repository.dart';
import 'package:personal_manager/data/sqlite/database_helper.dart';
import 'package:personal_manager/models/tasks_model.dart';
import 'package:sqlbrite/sqlbrite.dart';

class TasksSqliteRepository implements TasksRepository {
  final dbInstance = SqliteDatabaseHelper();

  @override
  Future<int> deleteTask(Task task) async {
    final db = await dbInstance.streamDatabase;
    return await db
        .delete(DbTables.tasks, where: 'id = ?', whereArgs: [task.id]);
  }

  @override
  Future<List<Task>> findAllTasks() async {
    final db = await dbInstance.streamDatabase;
    final tasksList = await db.query(DbTables.notes);
    final tasks = parseTasks(tasksList);
    return tasks;
  }

  @override
  Future<Task> findTaskById(int id) async {
    final db = await dbInstance.streamDatabase;
    final tasksList = await db.query(DbTables.tasks, where: 'id = $id');
    final tasks = parseTasks(tasksList);
    return tasks.first;
  }

  @override
  Future<int> insertTask(Task task) async {
    return SqliteDatabaseHelper.insert(DbTables.tasks, task.toMap());
  }

  @override
  Future<int> updateTask(Task task) async {
    final db = await dbInstance.streamDatabase;
    return await db.update(DbTables.tasks, task.toMap(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  @override
  Stream<List<Task>> watchAllTasks() async* {
    final db = await dbInstance.streamDatabase;
    yield* db.createQuery(DbTables.tasks).mapToList((row) => Task.fromMap(row));
  }

  List<Task> parseTasks(List<Map<String, dynamic>> tasksList) {
    final tasks = <Task>[];
    for (var taskMap in tasksList) {
      final task = Task.fromMap(taskMap);
      tasks.add(task);
    }
    return tasks;
  }
}
