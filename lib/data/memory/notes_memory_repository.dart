import 'package:personal_manager/data/repositories/notes_repository.dart';
import 'package:personal_manager/models/notes_model.dart';

class NotesMemoryRepository implements NotesRepository {
  @override
  Future<List<Note>> findAllNotes() {
    // TODO: implement findAllNotes
    throw UnimplementedError();
  }

  @override
  Stream<List<Note>> watchAllNotes() {
    // TODO: implement watchAllNotes
    throw UnimplementedError();
  }

  @override
  Future<int> insertNote(Note note) {
    // TODO: implement insertNote
    throw UnimplementedError();
  }

  @override
  Future<Note> findNoteById(int id) {
    // TODO: implement findNoteById
    throw UnimplementedError();
  }
}
