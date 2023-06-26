
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/Login_ui/login_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/add_address_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/edit_profile_screen.dart';

import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/profile_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/update_address_screen.dart';
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
      initialRoute: '/profile_screen',
      theme: ThemeData(
        fontFamily: 'jannah',
      ),
      routes: {
        '/launch_screen': (context) =>const LaunchScreen(),
        '/on_boarding_screen': (context) =>OnBoardingScreen(),
        '/login_screen': (context) =>LoginScreen(),
        '/main_screen': (context) =>const MainScreen(),
        '/profile_screen' : (context) => const ProfileScreen(),
        '/editProfile_screen' : (context) =>  EditProfileScreen(),
        '/addAddress_screen' : (context) =>  const AddAddressScreen(),
        '/updateAddress_screen' : (context) =>  const UpdateAddressScreen(),
      },
    );
  }
}
