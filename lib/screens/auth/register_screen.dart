
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  String? _gender;
  late final  TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _birthDayEditingController;
  late TapGestureRecognizer tapGestureRecognizer;
  late DateTime _birthday;


  String? _emailErrors;
  String? _passwordErrors;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _birthDayEditingController = TextEditingController();
    tapGestureRecognizer = TapGestureRecognizer();
  }

  bool _isSecure = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _birthDayEditingController.dispose();
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            children:[
              Center(
                child: Stack(
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
                          backgroundColor: Colors.black,
                          child: IconButton(
                            onPressed: (){
                              //Show Camera
                            },
                            icon: const Icon(Icons.camera_alt,color: Colors.white,size: 18,),
                          ),
                        ),
                      )


                    ],
                    ),
              ),

              const Text('Registration',style:
              TextStyle(color: UsedColor.PRIMARY_COLOR,
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 30,),
              Text('  Enter your first name',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(controller: _emailController, hint: 'First Name',errorText: _emailErrors, icon: Icons.badge),
              const SizedBox(height: 10,),

              Text('  Enter your mid name',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(controller: _emailController, hint: 'Mid Name',errorText: _emailErrors, icon: Icons.badge),
              const SizedBox(height: 10,),

              Text('  Enter your last name',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(controller: _emailController, hint: 'Last Name',errorText: _emailErrors,icon: Icons.badge),
              const SizedBox(height: 10,),

              Text('  Enter email Address',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(controller: _emailController, hint: 'Email',
                  errorText: _emailErrors, icon: Icons.email,
                  type: TextInputType.emailAddress),
              const SizedBox(height: 10,),


              Text(' Enter password',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(
                function: () {
                  setState(() {
                    _isSecure =!_isSecure;
                  });
                },
                controller: _passwordController, obSecureText: _isSecure,suffixIcon:_isSecure?Icons.visibility_off:Icons.visibility ,hint: 'Password',errorText:_passwordErrors, icon: Icons.lock,),
              const SizedBox(height: 10,),


              Text('  Enter Mobile Number',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(controller: _emailController, hint: 'Mobile',
                  errorText: _emailErrors, icon: Icons.phone,
              type: TextInputType.number),
              const SizedBox(height: 10,),


              Text('  Choose BirthDate',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(controller: _emailController,
                hint: 'BirthDate',
                errorText: _emailErrors,
                // icon: Icons.date_range,
                type: TextInputType.datetime
                , suffixIcon: Icons.date_range,function: _showDatePicker,),

              const SizedBox(height: 10,),


              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Male' , style: TextStyle(color: UsedColor.PRIMARY_COLOR),),
                      value: 'M',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() => _gender = value);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female', style: TextStyle(color: UsedColor.PRIMARY_COLOR)),
                      value: 'F',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() => _gender = value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),



              ElevatedButton(
                onPressed: (){
                // perFormRegister();
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: UsedColor.PRIMARY_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(double.infinity,50),
                ), child: const  Text('Register',style: TextStyle(fontSize: 20),),
              ),
              const SizedBox(height: 35,),


            ],
          )
      ),
    );


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

}



