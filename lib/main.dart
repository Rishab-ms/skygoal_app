// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:skygoal_app/style.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyGoal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Style.primaryColor, foregroundColor: Colors.white),
      ),
      home: const MyHomePage(),
    );
  }
}
