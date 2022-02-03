import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'Screens/surah.dart';

void main() {
  runApp(MaterialApp(
    title: "Quran Application",
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/Surah': (context) => SurahPage(),
    },
  ));
}
