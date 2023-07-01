import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';

class ResetForgottenPassword extends StatefulWidget {
  ResetForgottenPassword({Key? key}) : super(key: key);

  @override
  State<ResetForgottenPassword> createState() => _ResetForgottenPasswordState();
}

class _ResetForgottenPasswordState extends State<ResetForgottenPassword>
    with Helpers {
  String? _gender;
  late final TextEditingController _passwordController;
  late TapGestureRecognizer tapGestureRecognizer;
  late DateTime _birthday;

  String? _codeErrors;
  String? _passwordErrors;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    tapGestureRecognizer = TapGestureRecognizer();
  }

  bool _isSecure = false;

  @override
  void dispose() {
    _passwordController.dispose();
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColors,
            title: Text(
              'Change Forgotten Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            children: [
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '  Enter the reset code ',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextFiled(
                  controller: _passwordController,
                  hint: 'Reset code',
                  errorText: _codeErrors,
                  icon: Icons.message),
              const SizedBox(
                height: 20,
              ),
              Text(
                ' Enter new password',
                style: TextStyle(color: Colors.grey),
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
                suffixIcon: _isSecure ? Icons.visibility_off : Icons.visibility,
                hint: 'New password',
                errorText: _passwordErrors,
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Confirm new password',
                style: TextStyle(color: Colors.grey),
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
                suffixIcon: _isSecure ? Icons.visibility_off : Icons.visibility,
                hint: 'Confirm password',
                errorText: _passwordErrors,
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  // perFormRegister();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColors,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          )),
    );
  }
}
