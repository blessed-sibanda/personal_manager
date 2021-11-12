import 'package:personal_manager/models/notes_model.dart';

abstract class NotesRepository {
  Future<List<Note>> findAllNotes();
  Stream<List<Note>> watchAllNotes();
}
