import 'package:flutter/material.dart';
// import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';
import 'package:hexcolor/hexcolor.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);


  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with Helpers {

  late TextEditingController _currentPasswordTextController;
  late TextEditingController _newPasswordTextController;
  late TextEditingController _newPasswordConfirmationTextController;


  @override
  void initState() {
    super.initState();
    _currentPasswordTextController = TextEditingController();
    _newPasswordTextController = TextEditingController();
    _newPasswordConfirmationTextController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordTextController.dispose();
    _newPasswordTextController.dispose();
    _newPasswordConfirmationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
        backgroundColor: HexColor('#4B989C'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Text(
            'Enter new password....',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Need to be safe! Change your password now',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFiled(
            controller: _currentPasswordTextController,
            obSecureText: true,
            hint: 'Current Password',
            icon: Icons.lock,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFiled(
            controller: _newPasswordTextController,
            obSecureText: true,
            hint: 'New Password',
            icon: Icons.lock,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFiled(
            controller: _newPasswordConfirmationTextController,
            obSecureText: true,
            hint: 'Password Confirmation',
            icon: Icons.lock,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async => await performChangePassword(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 50),
              backgroundColor: HexColor('#4B989C'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Change Password',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performChangePassword() async {
    if (checkData()) {
      await changePassword();
    }
  }

  bool checkData() {
    if (checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_newPasswordTextController.text.isNotEmpty &&
        _newPasswordConfirmationTextController.text.isNotEmpty) {
      if (_newPasswordTextController.text ==
          _newPasswordConfirmationTextController.text) {
        return true;
      }
      showSnackBar(
        context: context,
        message: 'Password Confirmation Error!',
        error: true,
      );
      return false;
    }
    showSnackBar(
      context: context,
      message: 'Enter New Password!',
      error: true,
    );
    return false;
  }

  Future<void> changePassword() async {
    // bool status = await AuthApiController().changePassword(
    //   context,
    //   currentPassword: _currentPasswordTextController.text,
    //   newPassword: _newPasswordTextController.text,
    // );
    // if (status && context.mounted) Navigator.pop(context);
  }
}
