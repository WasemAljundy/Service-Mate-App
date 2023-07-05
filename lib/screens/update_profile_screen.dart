import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/profile_api_controller.dart';
import 'package:gp_106_flutter_project/model/client.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../constent.dart';
import '../helpers/helpers.dart';
import '../widgets/text_field_refactor.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>
    with Helpers {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _birthDateController;
  String _gender = 'male';

  XFile? _pickedFile;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _birthDateController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColors,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Update Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: primaryColors,
            height: 20,
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(top: 50),
                  padding: const EdgeInsetsDirectional.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                      topEnd: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        const Text(
                          'Full Name',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldRefactor(
                          controller: _nameController,
                          prefixIcon: Icons.person,
                          hint: 'Enter new Fullname',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldRefactor(
                          controller: _phoneController,
                          prefixIcon: Icons.phone,
                          hint: 'Enter new Phone Number',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'birth date',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          enabled: true,
                          controller: _birthDateController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: 'Select new Birth Date',
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                              onPressed: () => _selectDate(context),
                              icon: const Icon(
                                Icons.date_range,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: primaryColors,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Gender',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                activeColor: primaryColors,
                                title: const Text('Male'),
                                contentPadding: EdgeInsets.zero,
                                value: 'male',
                                groupValue: _gender,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                activeColor: primaryColors,
                                title: const Text('Female'),
                                contentPadding: EdgeInsets.zero,
                                value: 'female',
                                groupValue: _gender,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            performUpdate();
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
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
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'images/photo.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () => _pickImage(),
                        child: Icon(
                          Icons.camera_alt,
                          color: primaryColors,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // late DateTime _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final DateTime today = DateTime.now();
      if (picked.isAfter(today) && context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Invalid Date'),
              content: const Text('Please select a valid birth date.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          String formattedDate = DateFormat.yMMMMEEEEd().format(picked);
          _birthDateController.text = formattedDate;
        });
      }
    }
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

  bool checkData() {
    if (_nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _birthDateController.text.isNotEmpty &&
        _pickedFile != null &&
        _gender.isNotEmpty) {
      return true;
    } else {
      showSnackBar(
          context: context, message: 'Enter required data!', error: true);
      return false;
    }
  }

  // Client get client {
  //   Client client = Client();
  //   client.fullName = _nameController.text;
  //   client.mobile = _phoneController.text;
  //   client.image = _pickedFile!.path;
  //   client.birthDate = _birthDateController.text;
  //   client.gender = _gender;
  //   return client;
  // }

  Future<void> update() async {
    ProfileApiController().updateClient(
      id: SharedPrefController().clientID.toString(),
      context,
      // client: client,
      fullName: _nameController.text,
      gender: _gender,
      mobile: _phoneController.text,
      birthDate: _birthDateController.text,
      path: _pickedFile!.path,
    );
  }

  Future<void> performUpdate() async {
    if (checkData()) {
      await update();
    }
  }
}
