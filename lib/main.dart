import 'package:flutter/material.dart';
import 'package:reminder/screens/home/home_screen.dart';
import 'package:reminder/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      title: 'Todo',
      home: MyHomePage(
        title: 'Reminder',
      ),
    );
  }
}
