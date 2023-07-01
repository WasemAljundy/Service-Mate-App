import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class AddAttachmentScreen extends StatefulWidget {
  const AddAttachmentScreen({Key? key}) : super(key: key);

  @override
  State<AddAttachmentScreen> createState() => _AddAttachmentScreenState();
}

class _AddAttachmentScreenState extends State<AddAttachmentScreen> {

  XFile? _pickedFile;
  final ImagePicker _imagePicker = ImagePicker();
  double? _progressValue = 0;
  late TextEditingController nameController;
  late TextEditingController infoController;
  List<int> listAttachmentType = [
   1,2,3,4,5,6
  ];

  int? _selectedAttachmentType;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    infoController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    infoController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColors,
        title: Text('Add Attachments'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.all(10),
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: DottedBorder(
              color:primaryColors,
              // strokeWidth: 1.0,
              dashPattern: [5, 8],
              borderType: BorderType.RRect,
              radius: Radius.circular(8.0),
              child: Center(
                child: _pickedFile != null
                    ? Image.file(File(_pickedFile!.path))
                    : TextButton.icon(
                  onPressed: () async => await pickImage(),
                  icon: Icon(
                    Icons.upload_file_outlined,
                    color: primaryColors,
                    size: 60,
                  ),
                  label: Text(
                    'Pick File',
                    style: TextStyle(color: primaryColors, fontSize: 30),
                  ),
                ),
              )
            ),
          ),
          SizedBox(height: 40,),
          // Text('Attachment Name',style: TextStyle(color: primaryColors),),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Attachment Name',
              prefixIcon: Icon(Icons.attachment_outlined,color: primaryColors,),
              labelStyle: TextStyle(color: primaryColors),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green))
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller:infoController ,
            maxLines: 6,
            decoration: InputDecoration(
                alignLabelWithHint: true,
              labelText: 'Info',
              labelStyle: TextStyle(color: primaryColors),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green))
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsetsDirectional.only(top: 10,start: 15,end: 15),
            child: DropdownButton<int>(
              hint: Text('Attachment type', style: TextStyle(color: primaryColors)),
              items: listAttachmentType.map((e) {
                return DropdownMenuItem(
                  child: Text('$e'),
                  value: e,
                );
              }).toList(),
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    _selectedAttachmentType = value;
                  });
                }
              },
              value: _selectedAttachmentType,
              isExpanded: true,
              underline: SizedBox(), // لإزالة الخط السفلي
              iconEnabledColor: primaryColors,
              iconSize: 30,
              elevation: 5,
              dropdownColor: Colors.white, // لتعيين لون الخلفية الخاصة بالقائمة المنسدلة
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsetsDirectional.only(top: 10,start: 15,end: 15),
            child: DropdownButton<int>(
              hint: Text('Select Reservation', style: TextStyle(color: primaryColors)),
              items: listAttachmentType.map((e) {
                return DropdownMenuItem(
                  child: Text('$e'),
                  value: e,
                );
              }).toList(),
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    _selectedAttachmentType = value;
                  });
                }
              },
              value: _selectedAttachmentType,
              isExpanded: true,
              underline: SizedBox(), // لإزالة الخط السفلي
              iconEnabledColor: primaryColors,
              iconSize: 30,
              elevation: 5,
              dropdownColor: Colors.white, // لتعيين لون الخلفية الخاصة بالقائمة المنسدلة
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              minimumSize: Size(double.infinity, 55),
              backgroundColor: primaryColors,
              textStyle: TextStyle(color: Colors.white,fontSize: 24)
            ),
              onPressed: (){}, child: Text('Add')),
          SizedBox(height: 20,),
        ],
      )
    );
  }

  Future<void> pickImage()async{
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  Future<void> uploadImage() async {

  }
}
