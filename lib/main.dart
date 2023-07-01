import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/screens/add_attachment_screen.dart';
import 'package:gp_106_flutter_project/screens/articles_details_screen.dart';
import 'package:gp_106_flutter_project/screens/articles_screen.dart';
import 'package:gp_106_flutter_project/screens/attachment_details_screen.dart';
import 'package:gp_106_flutter_project/screens/attachments.screen.dart';
import 'package:gp_106_flutter_project/screens/categories_screen.dart';
import 'package:gp_106_flutter_project/screens/contact_us_screen.dart';
import 'package:gp_106_flutter_project/screens/edit_profile.dart';
import 'package:gp_106_flutter_project/screens/profile.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
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
        fontFamily: 'Janna',
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColors,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColors,

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 55),
            backgroundColor: primaryColors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          )
        )
      ),
      routes: {
        '/launch_screen': (context) =>LaunchScreen(),
        '/on_boarding_screen': (context) =>OnBoardingScreen(),
        // '/login_screen': (context) =>LoginScreen(),
        '/main_screen': (context) =>MainScreen(),
        '/profile_screen' : (context) => const ProfileScreen(),
        '/editProfile_screen' : (context) => const EditProfileScreen(),
        '/categories_screen' : (context) =>  CategoryScreen(),
        '/articles_screen' : (context) =>  ArticlesScreen(),
        '/articles_details_screen' : (context) =>  ArticlesDetailsScreen(),
        '/add_attachment_screen' : (context) =>  AddAttachmentScreen(),
        '/attachments_screen' : (context) =>  AttachmentsScreen(),
        '/attachment_details_screen' : (context) =>  AttachmentDetailsScreen(),
        '/contact_us_screen' : (context) =>  ContactUsScreen(),
      },
    );
  }
}
