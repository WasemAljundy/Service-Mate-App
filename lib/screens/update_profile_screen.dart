import 'package:flutter/material.dart';
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

class _UpdateProfileScreenState extends State<UpdateProfileScreen> with Helpers{

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _birthDateController;
  String _gender = 'M';

  XFile? _pickedFile;
  final ImagePicker _imagePicker = ImagePicker();


  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Anas Ashraf Alsafadi');
    _phoneController = TextEditingController(text: '059 2204656');
    _birthDateController = TextEditingController(text: 'june 9 1986');
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
          onPressed: () {
            Navigator.pop(context);
          },
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
                            topEnd: Radius.circular(20))
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 70,),
                          Text('Full Name',
                            style: TextStyle(color: Colors.grey, fontSize: 16),),
                          SizedBox(height: 10,),
                          TextFieldRefactor(controller: _nameController,
                              prefixIcon: Icons.person,
                              label: ''),
                          SizedBox(height: 20,),
                          Text('phone number',
                            style: TextStyle(color: Colors.grey, fontSize: 16),),
                          SizedBox(height: 10,),
                          TextFieldRefactor(controller: _phoneController,
                              prefixIcon: Icons.phone,
                              label: ''),
                          SizedBox(height: 20,),
                          Text('birth date',
                            style: TextStyle(color: Colors.grey, fontSize: 16),),
                          SizedBox(height: 10,),
                          TextField(
                            enabled: true,
                            controller: _birthDateController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(onPressed: () =>
                                    _selectDate(context), icon: Icon(
                                    Icons.date_range)),
                                labelStyle: TextStyle(color: primaryColors),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.green))
                            ),
                          ),
                          SizedBox(height: 30,),
                          Text('Gender',
                            style: TextStyle(color: Colors.grey, fontSize: 16),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile<String>(
                                  activeColor: primaryColors,
                                  title: const Text('Male'),
                                  contentPadding: EdgeInsets.zero,
                                  value: 'M',
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
                                  value: 'F',
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
                          SizedBox(height: 40,),
                          ElevatedButton(onPressed: () {
                            performUpdate();
                          },
                              child: Text(
                                'Update', style: TextStyle(fontSize: 24),))
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
                          child: Image.asset(
                            'assets/images/gazageeks1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsetsDirectional.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.upload_file, color: primaryColors,),
                      )
                    ],
                  )
                ],
              )),
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
      if (picked.isAfter(today)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Date'),
              content: Text('Please select a valid birth date.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          String formattedDate = DateFormat.yMMMMd().format(picked);
          _birthDateController.text = formattedDate;
        });
      }
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  bool checkData() {
    if (_nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _birthDateController.text.isNotEmpty&&
        _gender.isNotEmpty) {
      return true;
    } else {
      showSnackBar(context: context, message: 'Enter required data!',error: true);
      return false;
    }
  }

  void update() {

  }

  void performUpdate() {
    if (checkData()) {
      update();
    }
  }

}