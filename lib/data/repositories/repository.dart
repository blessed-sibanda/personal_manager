import 'notes_repository.dart';
import 'contacts_repository.dart';

abstract class Repository implements NotesRepository, ContactsRepository {
  void close();
}
