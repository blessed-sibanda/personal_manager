import 'package:personal_manager/models/notes_model.dart';

abstract class NotesRepository {
  Future<List<Note>> findAllNotes();
  Future<Note> findNoteById(int id);
  Stream<List<Note>> watchAllNotes();
  Future<int> insertNote(Note note);
  Future<dynamic> updateNote(Note note);
  Future<void> deleteNote(Note note);
}
