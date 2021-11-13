import 'package:flutter/cupertino.dart';

class AppointmentsScreens {
  static const list = 0;
  static const entry = 1;
}

class AppointmentsManager extends ChangeNotifier {
  int? _selectedId;

  int _screen = AppointmentsScreens.list;

  int get screen => _screen;

  int? get selectedId => _selectedId;

  void addAppointment() {
    _screen = AppointmentsScreens.entry;
    notifyListeners();
  }

  void savedAppointment() {
    _selectedId = null;
    notifyListeners();
  }

  void editAppointment(int appointmentId) {
    _screen = AppointmentsScreens.entry;
    _selectedId = appointmentId;
    notifyListeners();
  }

  void resetScreen() {
    _screen = AppointmentsScreens.list;
    notifyListeners();
  }
}
