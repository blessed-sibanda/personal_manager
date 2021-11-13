import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime? date) {
  return DateFormat.yMMMEd('en_US').format(date!.toLocal());
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
