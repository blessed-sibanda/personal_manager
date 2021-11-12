import 'package:flutter/cupertino.dart';

class TasksScreens {
  static const list = 0;
  static const entry = 1;
}

class TasksManager extends ChangeNotifier {
  int? _selectedId;

  int _screen = TasksScreens.entry;

  int get screen => _screen;

  int? get selectedId => _selectedId;

  void addTask() {
    _screen = TasksScreens.entry;
    notifyListeners();
  }

  void savedTask() {
    _selectedId = null;
    notifyListeners();
  }

  void editTask(int taskId) {
    _screen = TasksScreens.entry;
    _selectedId = taskId;
    notifyListeners();
  }

  void resetScreen() {
    _screen = TasksScreens.list;
    notifyListeners();
  }
}
