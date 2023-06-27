
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with Helpers {

  late final  TextEditingController _emailController;
  late TapGestureRecognizer tapGestureRecognizer;

  String? _emailErrors;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    tapGestureRecognizer = TapGestureRecognizer();
    tapGestureRecognizer.onTap = navigateToRegisterScreen;
  }

  @override
  void dispose() {
    _emailController.dispose();
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
              Align(
                  alignment: Alignment.center,
                  child:Image.asset('images/blue_logo.png',width: 200,height: 200,)
              ),
              const Text('Forgot Password',style: TextStyle(color: UsedColor.PRIMARY_COLOR,fontSize: 24,fontWeight: FontWeight.w900),),
              const SizedBox(height: 30,),
              Row(
                children: const [
                  Text('  Enter email Address',style: TextStyle(color: Colors.grey),),
                ],
              ),
              const SizedBox(height: 5,),
              AppTextFiled(controller: _emailController, hint: 'Email',errorText: _emailErrors,icon: Icons.email,),
              const SizedBox(height: 10,),

              const SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                perFormLogin();
              },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: UsedColor.PRIMARY_COLOR,
                  minimumSize: const Size(double.infinity,50),
                ), child: const  Text('Send verification message',style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 10),

            ],
          )
      ),
    );
  }


  void perFormLogin(){
    if(checkData()){
      login();
    }
  }

  bool checkData(){
    if(_emailController.text.isNotEmpty ){
      checkErrors();
      return true;
    }
    checkErrors() ;
    showSnackBar(message: 'Login In Failed', error: true, context: context);
    return false;
  }

  void checkErrors(){

    setState(() {
      _emailErrors = _emailController.text.isEmpty?'Enter Email Address':null;
    });
  }

  void login(){
    showSnackBar(message: 'Login In Successfully', error: false, context: context);
    Future.delayed(const Duration(seconds: 1),(){
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }

  void navigateToRegisterScreen(){
    Navigator.pushNamed(context, '/register_screen');
  }

}



