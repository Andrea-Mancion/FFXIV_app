import 'package:flutter/material.dart';
import 'welcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Fantasy XIV App',
      home: WelcomePage(),
    );
  }
}