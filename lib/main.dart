import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/Login_ui/login_screen.dart';
import 'package:gp_106_flutter_project/Login_ui/singup_screen.dart';
import 'Login_ui/welcome_screen.dart';
import 'package:gp_106_flutter_project/screens/edit_profile.dart';
import 'package:gp_106_flutter_project/screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/profile_screen',
      routes: {
        '/profile_screen' : (context) => const ProfileScreen(),
        '/editProfile_screen' : (context) => const EditProfileScreen(),
      },
    );
  }
}