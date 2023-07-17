import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/widgets/secondary_text_filed.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../screens_keys.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();

}


late TextEditingController _dataTypeEditingController;
late TextEditingController _dataValueEditingController;
late TextEditingController _infoEditingController;
late TextEditingController _typeEditingController;
class _AddDataScreenState extends State<AddDataScreen> {



  late bool _isActive = false;
  late bool _isRequired = false;
  String? _gender;
  final List<String> _genderList = ['Female','Male'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataTypeEditingController = TextEditingController();
    _dataValueEditingController = TextEditingController();
    _infoEditingController = TextEditingController();
    _typeEditingController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _dataTypeEditingController.dispose();
    _dataValueEditingController.dispose();
    _infoEditingController.dispose();
    _typeEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#4B989C'),
        title: const Text('Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child: ListView(
          children: [

            const Text(
                'Add Data',
              style: TextStyle(
                color: Color(0Xff4B989C) ,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15,),

            SecondaryTextFiled(controller: _dataValueEditingController, hint: 'value', icon : Icons.data_exploration_outlined , type: TextInputType.text,),
            const  SizedBox(height: 10),
            SecondaryTextFiled(controller: _dataTypeEditingController, hint: 'data type',type: TextInputType.text,icon: Icons.data_thresholding_outlined),
            const SizedBox(height: 10,),

            SecondaryTextFiled(controller: _infoEditingController, hint: 'info', icon : Icons.info_outline , type: TextInputType.text,),
            const SizedBox(height: 10,),
            SecondaryTextFiled(controller: _typeEditingController, hint: 'type', icon : Icons.merge_type , type: TextInputType.text,),

            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0Xff4B989C)),
              ),
              child: DropdownButton(
                hint: const Text('gender'),
                value: _gender,
                items: _genderList.map((item) =>
                    DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                isDense: true,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_sharp, size: 30,),
              ),

            ),

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
            SwitchListTile(
                activeColor: HexColor('#4B989C'),

                title: const Text('Required',style: TextStyle(
                    fontSize: 18
                ),),
                contentPadding: const EdgeInsets.symmetric(horizontal:10),
                subtitle: const Text('On/OFF'),
                value: _isRequired, onChanged: (bool value){
              setState(() {
                _isRequired = value;
              });
            }
            ),
            const SizedBox(height: 10),
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
    if(_dataTypeEditingController.text.isNotEmpty
        && _dataValueEditingController.text.isNotEmpty
        &&_infoEditingController.text.isNotEmpty
        &&_typeEditingController.text.isNotEmpty
        &&_gender!=null
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
