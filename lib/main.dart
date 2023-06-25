
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens/auth/login_screen.dart';
import 'package:gp_106_flutter_project/screens/launch_screen.dart';
import 'package:gp_106_flutter_project/screens/main_screen.dart';
import 'package:gp_106_flutter_project/screens/on_boarding_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initShared();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main_screen',
      theme: ThemeData(
        fontFamily: 'Jannah',
      ),
      routes: {
        '/launch_screen': (context) =>LaunchScreen(),
        '/on_boarding_screen': (context) =>OnBoardingScreen(),
        '/login_screen': (context) =>LoginScreen(),
        '/main_screen': (context) =>MainScreen(),
      },
    );
  }
}
