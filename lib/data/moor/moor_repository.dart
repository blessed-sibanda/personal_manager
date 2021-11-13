import 'package:personal_manager/data/moor/moor_db.dart';
import 'package:personal_manager/data/moor/notes_moor_repository.dart';
import 'package:personal_manager/data/moor/tasks_moor_repository.dart';
import 'package:personal_manager/data/repositories/repository.dart';

class MoorRepository
    with NotesMoorRepository, TasksMoorRepository
    implements Repository {
  @override
  void close() {
    PersonalManagerDatabase().close();
  }
}
