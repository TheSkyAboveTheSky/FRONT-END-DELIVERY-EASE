import 'package:flutter/material.dart';
import 'package:deliver_ease/Pages/Menu/MenuPage.dart';
import 'package:deliver_ease/Pages/Register/RegisterPage.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Profle/profile.dart';
import 'package:deliver_ease/Services/shared_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        if (settings.name == '/login') {
          return MaterialPageRoute(builder: (context) => LoginPage());
        } else if (settings.name == '/signup') {
          return MaterialPageRoute(builder: (context) => RegisterPage());
        } else {
          switch (settings.name) {
            case '/menu':
              return MaterialPageRoute(builder: (context) => MenuPage());
            case '/profile':
              return MaterialPageRoute(builder: (context) => ProfilePage());
            default:
              return MaterialPageRoute(builder: (context) => LoginPage());
          }
        }
      },
    );
  }
}
