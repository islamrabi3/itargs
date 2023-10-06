import 'package:flutter/material.dart';

const String apiUrl = 'https://api.quran.com/api/v4/chapter_recitations/1/1';
Locale? langCode;
Widget buildHeader(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  );
}
