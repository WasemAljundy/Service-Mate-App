import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/widgets/secondary_text_filed.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../screens_keys.dart';

class AddRateQuestionsScreen extends StatefulWidget {
  const AddRateQuestionsScreen({super.key});

  @override
  State<AddRateQuestionsScreen> createState() => _AddRateQuestionsScreenState();

}

late TextEditingController _questionEditingController;
late TextEditingController _respondedEditingController;
late TextEditingController _answerEditingController;


class _AddRateQuestionsScreenState extends State<AddRateQuestionsScreen> {



  late bool _isActive = false;
  String? _questionType;
  final List<String> _questionTypes = ['range','boolean'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _questionEditingController = TextEditingController();
    _respondedEditingController = TextEditingController();
    _answerEditingController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _questionEditingController.dispose();
    _respondedEditingController.dispose();
    _answerEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#4B989C'),
        title: const Text('Rate Questions'),
        centerTitle: true,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child: ListView(
          children: [

            const Text(
                'Add Rate Question',
              style: TextStyle(
                color: Color(0Xff4B989C) ,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15,),

            SecondaryTextFiled(controller: _questionEditingController, hint: 'Question', icon : Icons.question_mark , type: TextInputType.text,),
            const  SizedBox(height: 10),
            SecondaryTextFiled(controller: _respondedEditingController, hint: 'responded',type: TextInputType.text,icon: Icons.question_answer),
            const SizedBox(height: 10,),
            SecondaryTextFiled(controller: _answerEditingController, hint: 'Answer',type: TextInputType.text,icon: Icons.question_answer),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0Xff4B989C)),
              ),
              child: DropdownButton(
                hint: const Text('Question Type',
                  style: TextStyle(
                  fontSize: 12,
                    color:  Color(0Xff4B989C),
                ),),
                value: _questionType,
                items: _questionTypes.map((item) =>
                    DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _questionType = value!;
                  });
                },
                isDense: true,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_sharp, size: 30,color: Color(0Xff4B989C),),
              ),

            ),

            const SizedBox(height: 10,),
            SwitchListTile(
                activeColor: HexColor('#4B989C'),
                title: const Text('Active',style: TextStyle(
                    fontSize: 18
                ),),
                contentPadding: const EdgeInsets.symmetric(horizontal:10),
                subtitle: const Text('On/OFF'),
                value: _isActive, onChanged: (bool value){
              setState(() {
                _isActive = value;
              });
            }
            ),

            const SizedBox(height: 16),
            SizedBox(
              width: 150,
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
    );
  }




  void _checkData(){
    if(_questionEditingController.text.isNotEmpty
        && _respondedEditingController.text.isNotEmpty
         &&_answerEditingController.text.isNotEmpty
        &&_questionType!=null
    )
    {
      Navigator.pushNamed(context, ScreenKeys.dataKeysScreen);
    }else{
      _showSnackBar();
    }

  }

  void _showSnackBar(){

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Enter required data!'),
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
