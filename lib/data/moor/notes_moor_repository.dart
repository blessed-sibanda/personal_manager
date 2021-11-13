import 'package:moor_flutter/moor_flutter.dart';
import 'package:personal_manager/data/moor/moor_db.dart';
import 'package:personal_manager/data/repositories/notes_repository.dart';
import 'package:personal_manager/models/notes_model.dart';

class NotesMoorRepository implements NotesRepository {
  final NoteDao _noteDao = PersonalManagerDatabase().noteDao;

  Stream<List<Note>>? notesStream;

  @override
  Future<void> deleteNote(Note note) {
    return _noteDao.deleteNote(note.id!);
  }

  @override
  Future<List<Note>> findAllNotes() {
    return _noteDao.findAllNotes().then((List<MoorNoteData> moorNotes) {
      final notes = <Note>[];
      for (var moorNote in moorNotes) {
        final note = moorNoteToNote(moorNote);
        notes.add(note);
      }
      return notes;
    });
  }

  @override
  Future<Note> findNoteById(int id) {
    return _noteDao
        .findNoteById(id)
        .then((listOfNotes) => moorNoteToNote(listOfNotes.first));
  }

  @override
  Future<int> insertNote(Note note) {
    return _noteDao.insertNote(noteToInsertableMoorNote(note));
  }

  @override
  Future<bool> updateNote(Note note) {
    return _noteDao.updateNote(noteToInsertableMoorNote(note));
  }

  @override
  Stream<List<Note>> watchAllNotes() {
    notesStream ??= _noteDao.watchAllNotes();
    return notesStream!;
  }
}
