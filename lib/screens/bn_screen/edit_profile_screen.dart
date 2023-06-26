
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/widgets/secondary_text_filed.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {


    String? fullName;
    String? mobile;
    String? gender;
    String? address;
    String? birthDay;

  EditProfileScreen({
    this.fullName,
    this.mobile,
    this.address,
    this.birthDay,
    this.gender,
});




  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  late TextEditingController _fullNameEditingController;
  late TextEditingController _mobileEditingController;
  late TextEditingController _birthDayEditingController;
  late TextEditingController _addressEditingController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullNameEditingController =TextEditingController();
    _mobileEditingController =TextEditingController();
    _birthDayEditingController =TextEditingController();
    _addressEditingController =TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fullNameEditingController.dispose();
    _mobileEditingController.dispose();
    _birthDayEditingController.dispose();
    _addressEditingController.dispose();
    super.dispose();
  }

   late DateTime _birthday ;
    String? _gender;
    late File _image ;


  final List<String> _genderList = ['Female','Male'];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0Xff4B989C),
        elevation: 0,
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                width: double.maxFinite,

                color: const Color(0Xff4B989C),
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipOval(
                            child: Image.asset('images/photo.png' ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed: (){
                               _pickImage();
                              },
                              icon: const Icon(Icons.camera_alt,color: Colors.white,size: 18,),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8,),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hicats Sam'
                          ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),),
                        Text('hicatsrose@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          ),),
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  children: [

                    SecondaryTextFiled(controller: _fullNameEditingController,hint: 'FullName',icon: Icons.person_outline,type: TextInputType.text,errorText : 'Enter FullName'),
                    SecondaryTextFiled(controller: _mobileEditingController,hint: 'Mobile',icon: Icons.phone_enabled_outlined,type: TextInputType.phone,errorText : 'Enter Mobile Number'),
                    SecondaryTextFiled(controller: _birthDayEditingController,hint: 'BirthDay',icon: Icons.date_range_outlined ,suffixIcon: Icons.date_range_outlined,type: TextInputType.datetime,errorText : 'Enter BirthDay',function: ()=>_showDatePicker(),),


                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: 50,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0Xff4B989C)),
                      ),

                      child: DropdownButton(

                        hint: const Text('Gender'),
                        value: _gender,
                          items: _genderList.map((item) =>
                              DropdownMenuItem(
                               value: item,
                               child: Text(item),
                              ))
                              .toList(),
                          onChanged: (value){
                            setState(() {
                              _gender = value;
                            });
                          },
                      isDense: true,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down_sharp,size: 30,),
                      ),
                    ),
                     const SizedBox(height:20 ,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(onPressed: (){
                        _checkData();
                      },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:const Color(0Xff4B989C),
                            elevation: 0
                        ), child: const Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
              ),


            ],
          ),
        ],
      ),
    );



  }





  void _checkData(){
    if(_fullNameEditingController.text.isNotEmpty
        && _mobileEditingController.text.isNotEmpty
        && _birthday!=null
        &&_gender!.isNotEmpty
        && _image.path.isNotEmpty
        && _addressEditingController.text.isNotEmpty)
    {
      Navigator.pushNamed(context, '/profile_screen');
    }else{
      _showSnackBar();
    }

  }

  void _showDatePicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),)
          .then((value) {
            setState(() {
              _birthday = value!;
              _birthDayEditingController.text = value.toString();
              print(_birthday.toString());
            });

           });
  }

  Future<void> _pickImage() async {
    var image =  await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image as File;
    });
  }




    void _showSnackBar(){

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Enter required data'),
          backgroundColor: Colors.red,
          showCloseIcon: true,
          closeIconColor: Colors.yellow,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
          dismissDirection: DismissDirection.horizontal,
          onVisible: () => print('Visible'),
          elevation: 4,
          action: SnackBarAction(
            label: "UNDO",
            textColor: Colors.yellow,
            onPressed: () {},
          ),
        ),
      );

  }

  }
