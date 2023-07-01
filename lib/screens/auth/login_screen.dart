import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
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

  bool _isSecure = false;

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
                  'images/blue_logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              ),
              // const Text('Login',style: TextStyle(color: Colors.blue,fontSize: 22,fontWeight: FontWeight.w900),),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.grey,
                    size: 20,
                  ),
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
                  function: () {
                    setState(() {
                      _isSecure = !_isSecure;
                    });
                  },
                  controller: _passwordController,
                  obSecureText: _isSecure,
                  suffixIcon:
                      _isSecure ? Icons.visibility_off : Icons.visibility,
                  hint: 'Password',
                  errorText: _passwordErrors),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget password?',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  perFormLogin();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColors,
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
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    children: [
                      TextSpan(
                          recognizer: tapGestureRecognizer,
                          text: 'Create Now!',
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14))
                    ]),
              ),
            ],
          )),
    );
  }

  void perFormLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      checkErrors();
      return true;
    }
    checkErrors();
    showSnackBar(message: 'Login In Failed', error: true, context: context);
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

  void login() {
    showSnackBar(
        message: 'Login In Successfully', error: false, context: context);
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }

  void navigateToRegisterScreen() {
    Navigator.pushNamed(context, '/register_screen');
  }
}
