import 'package:personal_manager/data/repositories/contacts_repository.dart';
import 'package:personal_manager/models/contacts_model.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'database_helper.dart';

class ContactsSqliteRepository implements ContactsRepository {
  final dbInstance = SqliteDatabaseHelper();

  @override
  Future<List<Contact>> findAllContacts() async {
    final db = await dbInstance.streamDatabase;
    final contactsList = await db.query(DbTables.contacts);
    final contacts = parseContacts(contactsList);
    return contacts;
  }

  @override
  Stream<List<Contact>> watchAllContacts() async* {
    final db = await dbInstance.streamDatabase;
    yield* db
        .createQuery(DbTables.contacts)
        .mapToList((row) => Contact.fromJson(row));
  }

  List<Contact> parseContacts(List<Map<String, dynamic>> contactsList) {
    final contacts = <Contact>[];
    for (var noteMap in contactsList) {
      final note = Contact.fromJson(noteMap);
      contacts.add(note);
    }
    return contacts;
  }
}
