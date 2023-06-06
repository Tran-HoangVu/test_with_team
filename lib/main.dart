import 'package:flutter/material.dart';
import 'package:social_frontend/views/test_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nodejs and Flutter App',
      home: CardStackListView(),
    );
  }
}
