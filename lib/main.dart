
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/screens/auth/change_password.dart';
import 'package:gp_106_flutter_project/screens/auth/reset_forgotten_password.dart';
import 'package:gp_106_flutter_project/screens/auth/forgot_password.dart';
import 'package:gp_106_flutter_project/screens/auth/login_screen.dart';
import 'package:gp_106_flutter_project/screens/auth/register_screen.dart';
import 'package:gp_106_flutter_project/screens/edit_profile.dart';
import 'package:gp_106_flutter_project/screens/experencie/add_experencies_screen.dart';
import 'package:gp_106_flutter_project/screens/experencie/show_experiences.dart';
import 'package:gp_106_flutter_project/screens/experencie/update_experencies_screen.dart';
import 'package:gp_106_flutter_project/screens/faq/faq_details_screen.dart';
import 'package:gp_106_flutter_project/screens/faq/faq_screen.dart';
import 'package:gp_106_flutter_project/screens/profile.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens/launch_screen.dart';
import 'package:gp_106_flutter_project/screens/main_screen.dart';
import 'package:gp_106_flutter_project/screens/on_boarding_screen.dart';
import 'package:gp_106_flutter_project/reservations/reservations_screen.dart';
import 'package:gp_106_flutter_project/screens/services/service_details_screen.dart';
import 'package:gp_106_flutter_project/screens/services/service_work_time.dart';
import 'package:gp_106_flutter_project/screens/services/services.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';

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
      initialRoute: ScreenKeys.changePassword,
      theme: ThemeData(
        fontFamily: 'Jannah',
      ),
      routes: {
        ScreenKeys.launchScreen: (context) =>const LaunchScreen(),
        ScreenKeys.onBoardingScreen: (context) =>OnBoardingScreen(),
        ScreenKeys.mainScreen: (context) =>const MainScreen(),
        ScreenKeys.profileScreen : (context) => const ProfileScreen(),
        ScreenKeys.editProfileScreen : (context) => const EditProfileScreen(),
        ScreenKeys.loginScreen : (context) =>  const LoginScreen(),
        ScreenKeys.registerScreen : (context) =>  RegisterScreen(),
        ScreenKeys.forgotPassword : (context) =>  const ForgotPassword(),
        ScreenKeys.serviceScreen : (context) =>  const ServiceScreen(),
        ScreenKeys.serviceDetailsScreen : (context) =>  const ServiceDetailsScreen(),
        ScreenKeys.faqScreen : (context) =>  const FaqScreen(),
        ScreenKeys.showExperiences : (context) =>  const ShowExperiences(),
        ScreenKeys.faqDetailsScreen : (context) =>  const FaqDetailsScreen(),
        ScreenKeys.serviceWorkTimeScreen : (context) =>const ServiceWorkTime(),
        ScreenKeys.addExperenciesScreen : (context) =>  const AddExperiencesScreen(),
        ScreenKeys.updateExperiencesScreen : (context) =>  const UpdateExperiencesScreen(),
        ScreenKeys.reservationsScreen : (context) =>  const ReservationsScreen(),
        ScreenKeys.resetForgottenPassword : (context) =>  ResetForgottenPassword(),
        ScreenKeys.changePassword : (context) =>  ChangePasswordScreen(),
      },
    );
  }
}
