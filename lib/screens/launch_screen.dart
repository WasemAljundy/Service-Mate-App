import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    super.initState();
    String route = SharedPrefController().onBoarding?'/login_screen' : '/on_boarding_screen';
    Future.delayed(
      const  Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/blue_logo.png', fit: BoxFit.cover,height: 250,width: 250,),
      ),
    );
  }
}
