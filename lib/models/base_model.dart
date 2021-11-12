import 'package:flutter/foundation.dart';

abstract class BaseModel extends ChangeNotifier {
  int stackIndex = 0;
  List entityList = [];
  dynamic entityBeingEdited;
  String? chosenDate;

  void setChosenDate(String date) {
    chosenDate = date;
    notifyListeners();
  }
}
