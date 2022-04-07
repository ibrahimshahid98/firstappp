import 'package:firstattempt/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firstattempt/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: HomePage(),
      themeMode: ThemeMode.light,
      theme:ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: "/home",
      routes: {

        "/home" :(context) => HomePage(),
        "/login":(context) => LoginPage(),
      },
    );
  }
}