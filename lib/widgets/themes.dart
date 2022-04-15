import 'package:flutter/material.dart';

class MyTheme{

  static ThemeData lightTheme(BuildContext context) => ThemeData(
  appBarTheme: AppBarTheme(
  color: Colors.brown,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.black),
  textTheme: Theme.of(context).textTheme,
  ),
  primarySwatch: Colors.brown,);

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.brown,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,
    ),
    primarySwatch: Colors.brown,);

  //colors
static Color creamColor = Color (0xfff5f5f5);
static Color darkBluishColor = Color (0xff403b58);
}