import 'package:flutter/material.dart';
// import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
// import 'package:gp_106_flutter_project/screens/auth/reset_password_screen.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> with Helpers {
  late final TextEditingController _emailController;

  String? _emailErrors;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();

  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'images/blue_logo.png',
                width: 200,
                height: 200,
              ),
            ),
            Text(
              'Forgot Password',
              style: TextStyle(
                  color: HexColor('#4B989C'),
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  '  Enter email Address',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            AppTextFiled(
              controller: _emailController,
              hint: 'Email',
              errorText: _emailErrors,
              icon: Icons.email,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () => performForgetPassword(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: HexColor('#4B989C'),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Send verification message',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> performForgetPassword() async {
    if (checkData()) {
      await forgotPassword();
    }
  }

  bool checkData() {
    if (_emailController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter Your Email!',
      error: true,
    );
    return false;
  }

  Future<void> forgotPassword() async {
  //   bool status = await AuthApiController().forgotPassword(
  //     context,
  //     email: _emailController.text,
  //   );
  //   if (status && context.mounted) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ResetPasswordScreen(
  //           email: _emailController.text,
  //         ),
  //       ),
  //     );
  //   }
  }
}
