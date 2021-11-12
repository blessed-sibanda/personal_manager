import 'package:personal_manager/data/repositories/tasks_repository.dart';

import 'notes_repository.dart';
import 'contacts_repository.dart';

abstract class Repository
    implements NotesRepository, ContactsRepository, TasksRepository {
  void close();
}
