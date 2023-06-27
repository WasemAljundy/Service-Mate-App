
import 'package:flutter/material.dart';
// import 'package:gp_106_flutter_project/Login_ui/login_screen.dart';
import 'package:gp_106_flutter_project/Login_ui/singup_screen.dart';
import 'package:gp_106_flutter_project/screens/bills_screen.dart';
import 'package:gp_106_flutter_project/screens/payment_methods_screen.dart';
import 'Login_ui/welcome_screen.dart';
import 'package:gp_106_flutter_project/screens/edit_profile.dart';
import 'package:gp_106_flutter_project/screens/profile.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens/launch_screen.dart';
import 'package:gp_106_flutter_project/screens/main_screen.dart';
import 'package:gp_106_flutter_project/screens/auth/login_screen.dart';
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
      initialRoute: '/payment_methods_screen',
      theme: ThemeData(
        fontFamily: 'Jannah',
      ),
      routes: {
        '/launch_screen': (context) =>const LaunchScreen(),
        '/on_boarding_screen': (context) =>OnBoardingScreen(),
        '/login_screen': (context) =>const LoginScreen(),
        '/main_screen': (context) =>const MainScreen(),
        '/profile_screen' : (context) => const ProfileScreen(),
        '/editProfile_screen' : (context) => const EditProfileScreen(),
        '/payment_methods_screen' : (context) => const PaymentMethodScreen(),
        '/bills_screen' : (context) => const BillScreen(),
      },
    );
  }
}
