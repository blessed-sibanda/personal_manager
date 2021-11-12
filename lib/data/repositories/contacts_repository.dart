import 'package:personal_manager/models/contacts_model.dart';

abstract class ContactsRepository {
  Future<List<Contact>> findAllContacts();
  Stream<List<Contact>> watchAllContacts();
}
