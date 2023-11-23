import 'package:animation_demo_flutter/screens/sandbox.dart';
import 'package:flutter/material.dart';
import 'package:animation_demo_flutter/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      home: Sandbox(),
    );
  }
}
