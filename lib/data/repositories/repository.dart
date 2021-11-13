import 'notes_repository.dart';
import 'tasks_repository.dart';
import 'apoointments_repository.dart';

abstract class Repository
    implements NotesRepository, TasksRepository, AppointmentsRepository {
  void close();
}
