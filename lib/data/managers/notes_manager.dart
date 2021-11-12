import 'package:flutter/cupertino.dart';

class NotesScreens {
  static const list = 0;
  static const entry = 1;
}

class NotesManager extends ChangeNotifier {
  int? _selectedId;

  int _screen = NotesScreens.list;

  int get screen => _screen;

  int? get selectedId => _selectedId;

  void addNote() {
    _screen = NotesScreens.entry;
    notifyListeners();
  }

  void savedNote() {
    _selectedId = null;
    notifyListeners();
  }

  void editNote(int noteId) {
    _screen = NotesScreens.entry;
    _selectedId = noteId;
    notifyListeners();
  }

  void resetScreen() {
    _screen = NotesScreens.list;
    notifyListeners();
  }
}
