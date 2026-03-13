import 'package:flutter/material.dart';
import 'package:zrek_assignment/ui/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: .dark,
      home: HomeView(),
    );
  }
}
