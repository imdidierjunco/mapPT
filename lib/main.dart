import 'package:flutter/material.dart';
import 'package:mappt/ui/screens/home.dart';
import 'package:mappt/ui/screens/inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InicioScreen(),
    );
  }
}
