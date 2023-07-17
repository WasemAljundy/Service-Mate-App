import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late TapGestureRecognizer tapGestureRecognizer;

  String? _emailErrors;
  String? _passwordErrors;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    tapGestureRecognizer = TapGestureRecognizer();
    tapGestureRecognizer.onTap = navigateToRegisterScreen;
  }

  bool _isSecure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'images/logo.png',
                width: 200,
                height: 200,
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                color: UsedColor.PRIMARY_COLOR,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
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
            const Row(
              children: [
                Text(
                  ' Enter password',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            AppTextFiled(
              function: () {
                setState(() {
                  _isSecure = !_isSecure;
                });
              },
              controller: _passwordController,
              obSecureText: _isSecure,
              suffixIcon: _isSecure ? Icons.visibility : Icons.visibility_off,
              hint: 'Password',
              errorText: _passwordErrors,
              icon: Icons.lock,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, ScreenKeys.forgetPasswordScreen);
                },
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(
                      context, ScreenKeys.forgotPasswordScreen),
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: UsedColor.PRIMARY_COLOR,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                performLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: UsedColor.PRIMARY_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenKeys.registerScreen);
                  },
                  child: const Text(
                    'Create Now!',
                    style: TextStyle(
                      color: UsedColor.PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      checkErrors();
      return true;
    }
    checkErrors();
    showSnackBar(message: 'Login Failed', error: true, context: context);
    return false;
  }

  void checkErrors() {
    setState(() {
      _emailErrors =
          _emailController.text.isEmpty ? 'Enter Email Address' : null;
      _passwordErrors =
          _passwordController.text.isEmpty ? 'Enter Password' : null;
    });
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (status && context.mounted) {
      Navigator.pushReplacementNamed(context, ScreenKeys.mainScreen);
    }
  }

  void navigateToRegisterScreen() {
    Navigator.pushNamed(context, ScreenKeys.registerScreen);
  }
}
