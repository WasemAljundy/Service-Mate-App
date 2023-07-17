import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/controllers/attacment_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/getx/attachment_get_controller.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/attachment.dart';
import 'package:gp_106_flutter_project/model/attachment_type.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class AddAttachmentScreen extends StatefulWidget {
  AddAttachmentScreen({Key? key, required this.reservationId})
      : super(key: key);

  int reservationId;

  @override
  State<AddAttachmentScreen> createState() => _AddAttachmentScreenState();
}

class _AddAttachmentScreenState extends State<AddAttachmentScreen>
    with Helpers {
  XFile? _pickedFile;
  final ImagePicker _imagePicker = ImagePicker();
  double? _progressValue = 0;
  late TextEditingController nameController;
  late TextEditingController infoController;
  late TextEditingController _dateController;

  late DateTime _dateTime;
  List<int> listReservation = [1, 2, 3, 4, 5, 6];

  int? _selectedReservation;
  int? _selectedAttachmentType;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    infoController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    infoController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: const Text('Add Attachments'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<AttachmentType>>(
          future: AttachmentApiController().getAttachmentTypes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView(
                padding: const EdgeInsetsDirectional.all(10),
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: DottedBorder(
                        color: primaryColors,
                        dashPattern: [5, 8],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(8.0),
                        child: Center(
                          child: _pickedFile != null
                              ? Image.file(File(_pickedFile!.path))
                              : TextButton.icon(
                                  onPressed: () => selectPicture(),
                                  icon: Icon(
                                    Icons.upload_file_outlined,
                                    color: primaryColors,
                                    size: 60,
                                  ),
                                  label: Text(
                                    'Pick File',
                                    style: TextStyle(
                                        color: primaryColors, fontSize: 30),
                                  ),
                                ),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Attachment Name',
                        prefixIcon: Icon(
                          Icons.attachment_outlined,
                          color: primaryColors,
                        ),
                        labelStyle: TextStyle(color: primaryColors),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: infoController,
                    maxLines: 6,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Info',
                        labelStyle: TextStyle(color: primaryColors),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextFiled(
                    controller: _dateController,
                    hint: 'BirthDate',
                    icon: Icons.date_range,
                    type: TextInputType.datetime,
                    suffixIcon: Icons.touch_app_outlined,
                    function: _showDatePicker,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsetsDirectional.only(
                        top: 10, start: 15, end: 15),
                    child: DropdownButton<int>(
                      hint: Text('Attachment type',
                          style: TextStyle(color: primaryColors)),
                      onTap: () {},
                      items: snapshot.data!.map((e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(e.name),
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
                      underline: const SizedBox(), // لإزالة الخط السفلي
                      iconEnabledColor: primaryColors,
                      iconSize: 30,
                      elevation: 5,
                      dropdownColor: Colors
                          .white, // لتعيين لون الخلفية الخاصة بالقائمة المنسدلة
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 55),
                          backgroundColor: primaryColors,
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 24)),
                      onPressed: () async {
                        await performCreateAttachment();
                      },
                      child: const Text('Add')),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            } else {
              print(snapshot.error);
              return const CardError();
            }
          },
        ));
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

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        _dateTime = value!;
        _dateController.text = value.toString().replaceAll('00:00:00.000', '');
      });
    });
  }

  Attachment get attachment {
    Attachment attachment = Attachment();
    attachment.info = infoController.text;
    attachment.name = nameController.text;
    attachment.date = _dateController.text;
    attachment.url = _pickedFile!.path;
    attachment.status = 'Pending';
    attachment.reservationId = _selectedReservation!;
    attachment.reservationId = widget.reservationId;
    return attachment;
  }

  Future<void> performCreateAttachment() async {
    if (checkData()) {
      await create();
    }
  }

  Future<void> create() async {
    await AttachmentApiController().createAttachment(
      attachment: attachment,
      context: context,
      path: _pickedFile!.path,
    );

    print('ddd');
  }

  bool checkData() {
    if (_pickedFile != null &&
        nameController.text.isNotEmpty &&
        infoController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _selectedAttachmentType != null) {
      return true;
    }
    showSnackBar(
        context: context, message: 'Please Enter Required Data !', error: true);
    return false;
  }
}
