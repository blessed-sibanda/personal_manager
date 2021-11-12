import 'package:personal_manager/data/repositories/repository.dart';
import 'package:personal_manager/data/sqlite/contacts_sqlite_repository.dart';
import 'package:personal_manager/data/sqlite/database_helper.dart';
import 'package:personal_manager/data/sqlite/notes_sqlite_repository.dart';

class SqliteRepository
    with NotesSqliteRepository, ContactsSqliteRepository
    implements Repository {
  @override
  void close() {
    SqliteDatabaseHelper().close();
  }
}