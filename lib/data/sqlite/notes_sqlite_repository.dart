import 'package:personal_manager/data/repositories/notes_repository.dart';
import 'package:personal_manager/data/sqlite/database_helper.dart';
import 'package:personal_manager/models/notes_model.dart';
import 'package:sqlbrite/sqlbrite.dart';

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
  Future<int> updateNote(Note note) async {
    final db = await dbInstance.streamDatabase;
    return await db.update(DbTables.notes, note.toMap(),
        where: 'id = ?', whereArgs: [note.id]);
  }

  @override
  Stream<List<Note>> watchAllNotes() async* {
    final db = await dbInstance.streamDatabase;
    yield* db.createQuery(DbTables.notes).mapToList((row) => Note.fromMap(row));
  }

  List<Note> parseNotes(List<Map<String, dynamic>> notesList) {
    final notes = <Note>[];
    for (var noteMap in notesList) {
      final note = Note.fromMap(noteMap);
      notes.add(note);
    }
    return notes;
  }

  @override
  Future<int> insertNote(Note note) async {
    return SqliteDatabaseHelper.insert(DbTables.notes, note.toMap());
  }

  @override
  Future<Note> findNoteById(int id) async {
    final db = await dbInstance.streamDatabase;
    final notesList = await db.query(DbTables.notes, where: 'id = $id');
    final notes = parseNotes(notesList);
    return notes.first;
  }
}
