import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/widgets/text_field_refactor.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController subjectController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    nameController    = TextEditingController();
    emailController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    subjectController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('Contact Us',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w800),),
              Text('  Get Support and Inquiries',style: TextStyle(color: Colors.grey[600],fontSize: 16,fontWeight: FontWeight.w800),),
              SizedBox(height: 30,),
              TextFieldRefactor(controller: nameController,prefixIcon: Icons.person,label: 'Name'),
              SizedBox(height: 20,),
              TextFieldRefactor(controller: emailController,prefixIcon: Icons.email,label: 'Email',type: TextInputType.emailAddress),
              SizedBox(height: 20,),
              TextFieldRefactor(controller: subjectController,prefixIcon: Icons.subject,label: 'Subject'),
              SizedBox(height: 20,),
              TextField(
                controller: emailController,
                maxLines: 6,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                    labelText: 'Message',
                    labelStyle: TextStyle(color: primaryColors),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green))
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){}, child: Text('Send Now',style: TextStyle(fontSize: 22),))
            ],
          ),
        ),
      ),
    );
  }
}

