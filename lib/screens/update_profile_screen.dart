import 'dart:io';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/profile_api_controller.dart';
import 'package:gp_106_flutter_project/getx/profile_getx_controller.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/widgets/text_field_refactor.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>
    with Helpers {
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  late TextEditingController _birthDateController;
  String _gender = 'male';
  late DateTime _selectedDate;
  final format = DateFormat("yyyy-MM-dd");

  XFile? _pickedFile;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
    _birthDateController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
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
                          controller: _fullNameController,
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
                          'BirthDate',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DateTimeField(
                          controller: _birthDateController,
                          decoration: InputDecoration(
                            hintText: 'Enter new BirthDate',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: primaryColors,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          format: format,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            ).then((value) {
                              setState(() {
                                _selectedDate = value!;
                                _birthDateController.text = value.toString().replaceAll('00:00:00.000', '');
                              });
                              return null;
                            });
                          },
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
                      height: 115,
                      width: 115,
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
                        onTap: () => selectPicture(),
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

  bool checkData() {
    if (_fullNameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _pickedFile != null &&
        _gender.isNotEmpty) {
      return true;
    } else {
      showSnackBar(
        context: context,
        message: 'Enter required data!',
        error: true,
      );
      return false;
    }
  }

  Future<void> update() async {
    ProfileGetxController.to.updateClient(
      id: SharedPrefController().clientID.toString(),
      fullName: _fullNameController.text,
      gender: _gender,
      mobile: _phoneController.text,
      birthDate: _selectedDate.toString(),
      path: _pickedFile!.path,
    );
  }

  Future<void> performUpdate() async {
    if (checkData()) {
      await update();
    }
  }
}
