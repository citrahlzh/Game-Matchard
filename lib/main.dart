import 'package:flutter/material.dart';
import 'package:game_matchard/presentation/dashboard.dart';
import 'package:game_matchard/presentation/success.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: DashboardPage());
  }
}
