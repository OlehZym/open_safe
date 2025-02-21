import 'package:flutter/material.dart';
import 'package:open_safe/open_safe_page.dart';
import 'package:open_safe/password_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Open safe';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: PasswordPage(),
    );
  }
}