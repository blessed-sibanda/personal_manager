import 'notes_repository.dart';
import 'tasks_repository.dart';

abstract class Repository implements NotesRepository, TasksRepository {
  void close();
}
