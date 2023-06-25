import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/Login_ui/login_screen.dart';
import 'package:gp_106_flutter_project/Login_ui/singup_screen.dart';
import 'Login_ui/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SERVICE MATE',
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}