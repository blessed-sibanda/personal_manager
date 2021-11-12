import 'package:personal_manager/data/repositories/notes_repository.dart';
import 'package:personal_manager/data/sqlite/database_helper.dart';
import 'package:personal_manager/models/notes_model.dart';

class NotesSqliteRepository implements NotesRepository {
  final dbInstance = SqliteDatabaseHelper();

  @override
  Future<List<Note>> findAllNotes() async {
    final db = await dbInstance.streamDatabase;
    final notesList = await db.query(DbTables.notes);
    final notes = parseNotes(notesList);
    return notes;
  }

  @override
  Stream<List<Note>> watchAllNotes() {
    // TODO: implement watchAllNotes
    throw UnimplementedError();
  }

  List<Note> parseNotes(List<Map<String, dynamic>> notesList) {
    final notes = <Note>[];
    notesList.forEach((noteMap) {
      final note = Note.fromJson(noteMap);
      notes.add(note);
    });
    return notes;
  }
}
