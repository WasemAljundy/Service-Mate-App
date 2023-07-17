import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/client.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

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
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: _pickedFile != null
                        ? Image.file(
                      File(_pickedFile!.path),
                      fit: BoxFit.fill,
                    )
                        : Image.asset(
                      'images/photo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 35,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () => selectPicture(),
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
        _birthDayEditingController.text = value.toString().replaceAll('00:00:00.000', '');
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
    showSnackBar(
        context: context, message: 'Please Enter Required Data !', error: true);
    return false;
  }

  void selectPicture() {
    Dialogs.materialDialog(
      context: context,
      title: 'Choose Picture',
      msg: 'Select where you prefer to get the picture',
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        IconsOutlineButton(
          onPressed: () async => await _pickImageCamera(),
          text: 'Camera',
          iconData: CupertinoIcons.camera_fill,
          textStyle: const TextStyle(color: Colors.white),
          color: primaryColors,
          iconColor: Colors.white,
        ),
        IconsButton(
          onPressed: () async => await _pickImageGallery(),
          text: 'Gallery',
          iconData: CupertinoIcons.photo_on_rectangle,
          color: primaryColors,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  Future<void> _pickImageGallery() async {
    XFile? imageFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
        Navigator.pop(context);
      });
    }
  }

  Future<void> _pickImageCamera() async {
    XFile? imageFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
        Navigator.pop(context);
      });
    }
  }

  Future<void> register() async {
    AuthApiController().register(
      context,
      client: client,
      path: _pickedFile!.path,
      callBack: ({required String message,required bool  status}) {
        if(status){
          Navigator.pop(context);
          showSnackBar(
              context: context, message:message,);
        }else {
          showSnackBar(
              context: context, message: message, error: true);
        }
      },
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
