import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/add_address_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/add_data_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/add_rate_questions_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/data_keys_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/edit_profile_screen.dart';

import 'package:gp_106_flutter_project/screens/bills_screen.dart';
import 'package:gp_106_flutter_project/screens/payment_methods_screen.dart';
import 'package:gp_106_flutter_project/screens/auth/login_screen.dart';

import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/profile_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/update_address_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/update_data_keys_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/update_data_screen.dart';
import 'package:gp_106_flutter_project/screens/launch_screen.dart';
import 'package:gp_106_flutter_project/screens/main_screen.dart';
import 'package:gp_106_flutter_project/screens/on_boarding_screen.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/screens/add_attachment_screen.dart';
import 'package:gp_106_flutter_project/screens/articles_details_screen.dart';
import 'package:gp_106_flutter_project/screens/articles_screen.dart';
import 'package:gp_106_flutter_project/screens/attachment_details_screen.dart';
import 'package:gp_106_flutter_project/screens/attachments.screen.dart';
import 'package:gp_106_flutter_project/screens/categories_screen.dart';
import 'package:gp_106_flutter_project/screens/contact_us_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initShared();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/payment_methods_screen',
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
                      borderRadius: BorderRadius.circular(10))))),
      routes: {
        '/payment_methods_screen': (context) => const PaymentMethodScreen(),
        '/bills_screen': (context) => const BillScreen(),
        '/categories_screen': (context) => CategoryScreen(),
        '/articles_screen': (context) => ArticlesScreen(),
        '/articles_details_screen': (context) => ArticlesDetailsScreen(),
        '/add_attachment_screen': (context) => AddAttachmentScreen(),
        '/attachments_screen': (context) => AttachmentsScreen(),
        '/attachment_details_screen': (context) => AttachmentDetailsScreen(),
        '/contact_us_screen': (context) => ContactUsScreen(),
        '/launch_screen': (context) => const LaunchScreen(),
        '/on_boarding_screen': (context) => OnBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/profile_screen': (context) => const ProfileScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/editProfile_screen': (context) => EditProfileScreen(),
        '/add_address_screen': (context) => const AddAddressScreen(),
        '/update_address_screen': (context) => const UpdateAddressScreen(),
        '/add_data_screen': (context) => const AddDataScreen(),
        '/update_data_screen': (context) => const UpdateDataScreen(),
        '/data_keys_screen': (context) => const DataKeysScreen(),
        '/update_data_keys_screen': (context) => const UpdateDataKeysScreen(),
        '/add_questions_screen': (context) => const AddRateQuestionsScreen(),
      },
    );
  }
}
