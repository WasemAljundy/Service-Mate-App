import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:lottie/lottie.dart';

class DoneContactUsScreen extends StatefulWidget {
  const DoneContactUsScreen({Key? key}) : super(key: key);

  @override
  State<DoneContactUsScreen> createState() => _DoneContactUsScreenState();
}

class _DoneContactUsScreenState extends State<DoneContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Lottie.asset('contact_us.png',fit: BoxFit.cover,height: 150,),
            SizedBox(height: 40,),
            Text('Thank you for submitting your request, we will contact you as soon as possible',textAlign: TextAlign.center,style: TextStyle(color: primaryColors,fontSize: 24),),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, ScreenKeys.mainScreen);
            }, child: Text('Contnuie',style: TextStyle(color: Colors.white,fontSize: 22),))
          ],
        ),
      ),
    );
  }
}
