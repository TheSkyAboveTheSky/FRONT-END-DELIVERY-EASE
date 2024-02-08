import 'package:deliver_ease/Pages/Colie/ColieForm.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Register/RegisterForm.dart';
import 'package:deliver_ease/Pages/Register/RegisterPage.dart';
import 'package:deliver_ease/Pages/Register/VerificationScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(),
  home: ColieForm(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Container(
        // Contenu de votre application
      ),
    );
  }
}