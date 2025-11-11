import 'package:flutter/material.dart';
import 'package:labs1/screens/detail_screen.dart';
import 'package:labs1/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред на испити',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  MainScreen(),
        routes: {
          "/detail_screen": (context) =>  DetailScreen(),
        }
    );
  }
}