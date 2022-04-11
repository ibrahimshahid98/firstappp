import 'package:firstattempt/pages/login_page.dart';
import 'package:firstattempt/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:firstattempt/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:ThemeData(
        primarySwatch: Colors.brown,
       ),
      initialRoute: "/login",
      routes: {

        MyRoutes.homeRoute :(context) => HomePage(),
        MyRoutes.loginRoute :(context) => LoginPage(),
      },
    );
  }
}