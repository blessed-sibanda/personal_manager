import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/base_model.dart';

Directory? docsDir;

Future selectDate(
    BuildContext inContext, BaseModel inModel, String? inDateString) async {
  DateTime initialDate = DateTime.now();

  if (inDateString != null) {
    List dateParts = inDateString.split(',');
    initialDate = DateTime(
      int.parse(dateParts[0]),
      int.parse(dateParts[1]),
      int.parse(dateParts[2]),
    );
  }

  DateTime? picked = await showDatePicker(
      context: inContext,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  if (picked != null) {
    inModel.setChosenDate(DateFormat.yMMMM('en_US').format(picked.toLocal()));
    return '${picked.year},${picked.month},${picked.day}';
  }
}

const colors = [
  'red',
  'grey',
  'blue',
  'green',
  'yellow',
  'purple',
  'pink',
  'orange',
  'indigo',
  'cyan'
];

Color getColorFromString(String colorString) {
  Color color;
  switch (colorString) {
    case 'red':
      color = Colors.red;
      break;
    case 'blue':
      color = Colors.blue;
      break;
    case 'green':
      color = Colors.green;
      break;
    case 'yellow':
      color = Colors.yellow;
      break;
    case 'pink':
      color = Colors.pink;
      break;
    case 'purple':
      color = Colors.purple;
      break;
    case 'orange':
      color = Colors.orange;
      break;
    case 'indigo':
      color = Colors.indigo;
      break;
    case 'cyan':
      color = Colors.cyan;
      break;
    default:
      color = Colors.grey;
      break;
  }
  return color;
}
