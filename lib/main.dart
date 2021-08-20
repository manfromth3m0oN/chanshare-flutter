import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(InitializeApp());

class InitializeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => InitializeScreen(),
      },
    );
  }
}
