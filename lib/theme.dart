import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Color.fromRGBO(232, 231, 237, 1),
    primaryColor: Color.fromRGBO(217, 217, 217, 1),
    focusColor: Color.fromRGBO(235, 186, 23, 1),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Color.fromRGBO(232, 231, 237, 1),
    elevation: 0,
    iconTheme: IconThemeData(
      color: Color.fromRGBO(56, 55, 61, 1),
    ),
  );
}
