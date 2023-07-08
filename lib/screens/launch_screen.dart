import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:lottie/lottie.dart';
import '../screens_keys.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    super.initState();
    String route = '';
    if(SharedPrefController().onBoarding && SharedPrefController().loggedIn){
      route = ScreenKeys.mainScreen;
    }else if(SharedPrefController().onBoarding && SharedPrefController().loggedIn ==false){
      route = ScreenKeys.loginScreen;
    }else if(SharedPrefController().onBoarding  == false){
      route = ScreenKeys.onBoardingScreen;
    }

    print('SharedPrefController().onBoarding is : ${SharedPrefController().onBoarding}');
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
        child: Lottie.asset('images/loading.json', fit: BoxFit.fitWidth),
        // child: Image.asset('images/logo.png', fit: BoxFit.fill,height: 250,width: 250,),
      ),
    );
  }
}
