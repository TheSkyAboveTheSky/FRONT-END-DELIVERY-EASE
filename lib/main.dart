import 'package:flutter/material.dart';
import 'package:deliver_ease/pages/home.dart';
import 'package:deliver_ease/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Projet", debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}
