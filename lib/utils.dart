import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sticky_notes/constants.dart';

String generateRandomColor() {
  Random random = Random();
  int randomIndex = random.nextInt(colors.length);
  Color randomColor = colors[randomIndex];
  String hexColor = '#${randomColor.value.toRadixString(16).substring(2).toUpperCase()}';
  return hexColor;
}


Color hexToColor(String hexColor) {
  if (hexColor.startsWith("#")) {
    hexColor = hexColor.substring(1);
  }
  int colorValue = int.parse(hexColor, radix: 16);
  int withAlpha = 0xFF000000 + colorValue;
  return Color(withAlpha);
}


String formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  String formattedDate = DateFormat("d/M/yy").format(dateTime);
  
  return formattedDate;
}
