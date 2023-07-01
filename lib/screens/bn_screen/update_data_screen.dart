import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/widgets/secondary_text_filed.dart';
import 'package:hexcolor/hexcolor.dart';

class UpdateDataScreen extends StatefulWidget {
  const UpdateDataScreen({super.key});

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();

}


late TextEditingController _dataTypeEditingController;
late TextEditingController _dataValueEditingController;




class _UpdateDataScreenState extends State<UpdateDataScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataTypeEditingController = TextEditingController();
    _dataValueEditingController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _dataTypeEditingController.dispose();
    _dataValueEditingController.dispose();
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
                'Update Data',
              style: TextStyle(
                color: Color(0Xff4B989C) ,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15,),

            SecondaryTextFiled(controller: _dataValueEditingController, hint: 'value',errorText: 'Enter the value }', icon : Icons.data_exploration , type: TextInputType.text,),
            const  SizedBox(height: 10),
            SecondaryTextFiled(controller: _dataTypeEditingController, hint: 'Data Type',errorText: 'Enter  Data Type',type: TextInputType.text,icon: Icons.type_specimen),
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
                  'Update',
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
    )
    {
      Navigator.pushNamed(context, '/profile_screen');
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
