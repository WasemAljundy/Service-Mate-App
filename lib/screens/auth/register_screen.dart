import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/client.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  String? _gender;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _mobileController;
  late final TextEditingController _birthDayEditingController;
  late TapGestureRecognizer tapGestureRecognizer;
  late DateTime _birthday;

  String? _emailErrors;
  String? _passwordErrors;

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _mobileController = TextEditingController();
    _birthDayEditingController = TextEditingController();
    tapGestureRecognizer = TapGestureRecognizer();
  }

  bool _isSecure = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _birthDayEditingController.dispose();
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UsedColor.PRIMARY_COLOR,
        title: const Text(
          'Registration',
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
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipOval(
                    child: _pickedFile != null
                        ? Image.file(File(_pickedFile!.path))
                        : Image.asset('images/photo.png'),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 35,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () async => await _pickImage(),
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            '  Enter your full name',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          AppTextFiled(
              controller: _fullNameController,
              hint: 'Full name',
              errorText: _emailErrors,
              icon: Icons.badge),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '  Enter email Address',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          AppTextFiled(
              controller: _emailController,
              hint: 'Email',
              errorText: _emailErrors,
              icon: Icons.email,
              type: TextInputType.emailAddress),
          const SizedBox(
            height: 10,
          ),
          const Text(
            ' Enter password',
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
            suffixIcon: _isSecure ? Icons.visibility : Icons.visibility_off,
            hint: 'Password',
            errorText: _passwordErrors,
            icon: Icons.lock,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '  Enter Mobile Number',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          AppTextFiled(
              controller: _mobileController,
              hint: 'Mobile',
              errorText: _emailErrors,
              icon: Icons.phone,
              type: TextInputType.number),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '  Choose BirthDate',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          AppTextFiled(
            controller: _birthDayEditingController,
            hint: 'BirthDate',
            errorText: _emailErrors,
            icon: Icons.date_range,
            type: TextInputType.datetime,
            suffixIcon: Icons.touch_app_outlined,
            function: _showDatePicker,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Male',
                    style: TextStyle(color: UsedColor.PRIMARY_COLOR),
                  ),
                  value: 'male',
                  activeColor: UsedColor.PRIMARY_COLOR,
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() => _gender = value);
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Female',
                      style: TextStyle(color: UsedColor.PRIMARY_COLOR)),
                  value: 'female',
                  groupValue: _gender,
                  activeColor: UsedColor.PRIMARY_COLOR,
                  onChanged: (String? value) {
                    setState(() => _gender = value);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              performRegister();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: UsedColor.PRIMARY_COLOR,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Register',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        _birthday = value!;
        _birthDayEditingController.text = value.toString();
      });
    });
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_fullNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _mobileController.text.isNotEmpty &&
        _birthDayEditingController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _pickedFile != null &&
        _gender != null) {
      return true;
    }
    showSnackBar(context: context, message: 'Please Enter Required Data !', error: true);
    return false;
  }

  Future<void> _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
      });
    }
  }

  Future<void> register() async {
    AuthApiController().register(
      context,
      client: client,
      path: _pickedFile!.path,
    );
  }

  Client get client {
    Client client = Client();
    client.fullName = _fullNameController.text;
    client.email = _emailController.text;
    client.password = _passwordController.text;
    client.mobile = _mobileController.text;
    client.image = _pickedFile!.path;
    client.birthDate = _birthDayEditingController.text;
    client.gender = _gender!;
    return client;
  }

}
