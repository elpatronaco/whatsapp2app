import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

String getLastMessageFormattedDate(DateTime date) {
  final DateTime now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inDays == 0)
    return "${date.hour}:${date.minute}";
  else if (difference.inDays == 1)
    return "Ayer";
  else
    return "${date.day}/${date.month}/${date.year}";
}
