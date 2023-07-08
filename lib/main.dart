import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/screens/adresses/add_address_screen.dart';
import 'package:gp_106_flutter_project/screens/add_data_screen.dart';
import 'package:gp_106_flutter_project/screens/add_rate_questions_screen.dart';
import 'package:gp_106_flutter_project/screens/adresses/addresses_screen.dart';
import 'package:gp_106_flutter_project/screens/auth/change_password_screen.dart';
import 'package:gp_106_flutter_project/screens/auth/forgot_password_screen.dart';
import 'package:gp_106_flutter_project/screens/auth/register_screen.dart';
import 'package:gp_106_flutter_project/screens/category_details_screen.dart';
import 'package:gp_106_flutter_project/screens/contact_us/done_contact_us_screen.dart';
import 'package:gp_106_flutter_project/screens/data_keys_screen.dart';
import 'package:gp_106_flutter_project/screens/bills_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/favorite_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/home_screen.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/order_screen.dart';
import 'package:gp_106_flutter_project/screens/fv_tab_bar_screen/show_reservation.dart';
import 'package:gp_106_flutter_project/screens/update_profile_screen.dart';
import 'package:gp_106_flutter_project/screens/experencie/add_experencies_screen.dart';
import 'package:gp_106_flutter_project/screens/experencie/show_experiences_screen.dart';
import 'package:gp_106_flutter_project/screens/experencie/update_experencies_screen.dart';
import 'package:gp_106_flutter_project/screens/faq/faq_details_screen.dart';
import 'package:gp_106_flutter_project/screens/faq/faq_screen.dart';
import 'package:gp_106_flutter_project/screens/fv_tab_bar_screen/show_articles.dart';
import 'package:gp_106_flutter_project/screens/payment_methods_screen.dart';
import 'package:gp_106_flutter_project/screens/auth/login_screen.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens/bn_screen/profile_screen.dart';
import 'package:gp_106_flutter_project/screens/adresses/update_address_screen.dart';
import 'package:gp_106_flutter_project/screens/update_data_keys_screen.dart';
import 'package:gp_106_flutter_project/screens/update_data_screen.dart';
import 'package:gp_106_flutter_project/screens/launch_screen.dart';
import 'package:gp_106_flutter_project/screens/main_screen.dart';
import 'package:gp_106_flutter_project/screens/on_boarding_screen.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/screens/add_attachment_screen.dart';
import 'package:gp_106_flutter_project/screens/articles_details_screen.dart';
import 'package:gp_106_flutter_project/screens/articles_screen.dart';
import 'package:gp_106_flutter_project/screens/attachment_details_screen.dart';
import 'package:gp_106_flutter_project/screens/attachments.screen.dart';
// import 'package:gp_106_flutter_project/screens/categories_screen.dart';
import 'package:gp_106_flutter_project/screens/contact_us/contact_us_screen.dart';
import 'package:gp_106_flutter_project/screens/services/service_details_screen.dart';
import 'package:gp_106_flutter_project/screens/services/service_work_time_screen.dart';
import 'package:gp_106_flutter_project/screens/services/services_screen.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';

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
      initialRoute: ScreenKeys.launchScreen,
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
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: primaryColors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      routes: {
        ScreenKeys.loginScreen: (context) => const LoginScreen(),
        ScreenKeys.forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
        ScreenKeys.changePasswordScreen: (context) => const ChangePasswordScreen(),
        ScreenKeys.registerScreen: (context) =>  RegisterScreen(),
        ScreenKeys.addAddressScreen: (context) => const AddAddressScreen(),
        ScreenKeys.addDataScreen: (context) => const AddDataScreen(),
        ScreenKeys.addRateQuestionsScreen: (context) => const AddRateQuestionsScreen(),
        ScreenKeys.dataKeysScreen: (context) => const DataKeysScreen(),
        ScreenKeys.favoriteScreen: (context) => const FavoriteScreen(),
        ScreenKeys.homeScreen: (context) => HomeScreen(),
        ScreenKeys.orderScreen: (context) => const OrderScreen(),
        ScreenKeys.profileScreen: (context) => const ProfileScreen(),
        ScreenKeys.updateProfileScreen: (context) => const UpdateProfileScreen(),
        // ScreenKeys.updateAddressScreen: (context) => const UpdateAddressScreen(),
        ScreenKeys.updateDataKeysScreen: (context) => const UpdateDataKeysScreen(),
        ScreenKeys.updateDataScreen: (context) => const UpdateDataScreen(),
        ScreenKeys.addExperiencesScreen: (context) => const AddExperiencesScreen(),
        ScreenKeys.showExperiencesScreen: (context) => const ShowExperiencesScreen(),
        ScreenKeys.updateExperiencesScreen: (context) => const UpdateExperiencesScreen(),
        ScreenKeys.tapBarArticlesScreen: (context) => const TapBarArticlesScreen(),
        // ScreenKeys.faqDetailsScreen: (context) => const FaqDetailsScreen(),
        ScreenKeys.faqScreen: (context) => const FaqScreen(),
        ScreenKeys.articlesScreen: (context) => const ArticlesScreen(),
        ScreenKeys.reservationsScreen: (context) => const ReservationsScreen(),
        // ScreenKeys.serviceDetailsScreen: (context) => const ServiceDetailsScreen(),
        // ScreenKeys.serviceWorkTimeScreen: (context) => const ServiceWorkTimeScreen(),
        ScreenKeys.serviceScreen: (context) => const ServiceScreen(),
        ScreenKeys.addAttachmentScreen: (context) => const AddAttachmentScreen(),
        // ScreenKeys.articlesDetailsScreen: (context) => const ArticlesDetailsScreen(),
        // ScreenKeys.attachmentDetailsScreen: (context) => const AttachmentDetailsScreen(),
        ScreenKeys.attachmentsScreen: (context) => AttachmentsScreen(),
        ScreenKeys.billScreen: (context) => const BillScreen(),
        // ScreenKeys.categoryScreen: (context) => CategoryDetailsScreen(category),
        ScreenKeys.contactUsScreen: (context) => const ContactUsScreen(),
        ScreenKeys.launchScreen: (context) => const LaunchScreen(),
        ScreenKeys.mainScreen: (context) => const MainScreen(),
        ScreenKeys.onBoardingScreen: (context) => OnBoardingScreen(),
        ScreenKeys.paymentMethodScreen: (context) => const PaymentMethodScreen(),
        ScreenKeys.addressesScreen: (context) =>  AddressesScreen(),
        ScreenKeys.doneContactScreen: (context) =>  DoneContactUsScreen(),
      },
    );
  }
}