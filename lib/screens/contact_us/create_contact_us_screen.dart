import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/contact_us_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/get/contact_us_get_controller.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/contact_us_request.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:gp_106_flutter_project/widgets/text_field_refactor.dart';

class CreateContactUsScreen extends StatefulWidget {
  const CreateContactUsScreen({Key? key}) : super(key: key);

  @override
  State<CreateContactUsScreen> createState() => _CreateContactUsScreenState();
}

class _CreateContactUsScreenState extends State<CreateContactUsScreen> with Helpers{

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController subjectController;
  late TextEditingController messageController;
  late TextEditingController mobileController;


  @override
  void initState() {
    super.initState();
    nameController    = TextEditingController();
    emailController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
    mobileController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    subjectController.dispose();
    mobileController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('contact us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text('Contact Us',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w800),),
              Text('  Get Support and Inquiries',style: TextStyle(color: Colors.grey[600],fontSize: 16,fontWeight: FontWeight.w800),),
              const SizedBox(height: 30,),
              TextFieldRefactor(controller: nameController,prefixIcon: Icons.person,label: 'Name'),
              const SizedBox(height: 20,),
              TextFieldRefactor(controller: subjectController,prefixIcon: Icons.subject,label: 'Subject'),
              const SizedBox(height: 20,),
              TextFieldRefactor(controller: mobileController,prefixIcon: Icons.phone,label: 'Mobile',type: TextInputType.number),
              const SizedBox(height: 20,),
              TextField(
                controller: messageController,
                maxLines: 4,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                    labelText: 'Message',
                    labelStyle: TextStyle(color: primaryColors),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green))
                ),
              ),
              const SizedBox(height: 40,),
              ElevatedButton(onPressed: ()async{
               await  perFormCreate();
              }, child:const Text('Send Now',style: TextStyle(fontSize: 22),))
            ],
          ),
        ),
      ),
    );
  }

  bool checkData() {
    if (
        nameController.text.isNotEmpty &&
            mobileController.text.isNotEmpty &&
            subjectController.text.isNotEmpty &&
            messageController.text.isNotEmpty

                  ) {
      return true;
    }
    showSnackBar(
        context: context, message: 'Please Enter Required Data !', error: true);
    return false;
  }

  Future<void> perFormCreate()async{
    if(checkData()){
      create();
    }
  }

  Future<void> create()async{
  await ContactUsGetXController.to.createContactUs( contactUsRequestModel: contactUs,callBack: ({contactUsRequest, required String message,required bool  status}) {
    if(status){
      showSnackBar(
          context: context, message: message);
      Navigator.pop(context);
    }else{
      showSnackBar(
          context: context, message: message,error: true);
    }
    },);

  }

ContactUsRequest get contactUs{
  ContactUsRequest c = ContactUsRequest();
  c.name = nameController.text;
  c.status = 'pending';
  c.mobile = mobileController.text;
  c.subject = subjectController.text;
  c.message = messageController.text;
  c.summary = 'Done';
  return c;
}
}

