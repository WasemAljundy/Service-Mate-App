import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/widgets/secondary_text_filed.dart';
import 'package:hexcolor/hexcolor.dart';

class UpdateAddressScreen extends StatefulWidget {
  const UpdateAddressScreen({super.key});

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();

}


late TextEditingController _addressNameEditingController;
late TextEditingController _buildingEditingController;
late TextEditingController _flatNumberEditingController;
late TextEditingController _streetEditingController;

 bool _isPrimary =false;


class _UpdateAddressScreenState extends State<UpdateAddressScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addressNameEditingController = TextEditingController();
    _buildingEditingController = TextEditingController();
    _flatNumberEditingController = TextEditingController();
    _streetEditingController = TextEditingController();


  }


  @override
  void dispose() {
    // TODO: implement dispose
    _addressNameEditingController.dispose();
    _buildingEditingController.dispose();
    _flatNumberEditingController.dispose();
    _streetEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#4B989C'),
        title: const Text('Address'),
        centerTitle: true,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Update Address',
              style: TextStyle(
                color: Color(0Xff4B989C) ,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            SecondaryTextFiled(controller: _addressNameEditingController, hint: 'Address Name',errorText: 'Enter Address Name',type: TextInputType.text,icon: Icons.account_balance_outlined,function: (){
            },),
            const  SizedBox(height: 10),
            SecondaryTextFiled(controller: _buildingEditingController, hint: 'building',errorText: 'Enter Building Name',type: TextInputType.text,icon: Icons.location_city_rounded),
            const SizedBox(height: 10),
            SecondaryTextFiled(controller: _streetEditingController, hint: 'street' , errorText: 'Enter Street Name',type: TextInputType.text,icon: Icons.streetview_outlined),
            const SizedBox(height: 10),
            SecondaryTextFiled(controller: _flatNumberEditingController, hint: 'Flat Number', errorText: 'Enter Flat Number',type: TextInputType.text,icon: Icons.account_balance_outlined,),
            const SizedBox(height: 10),
            const SizedBox(height: 10),

            SwitchListTile(
                activeColor: HexColor('#4B989C'),

                title: const Text('Primary',style: TextStyle(
                    fontSize: 18
                ),),
                contentPadding: const EdgeInsets.symmetric(horizontal:10),
                subtitle: const Text('On/OFF'),
                value: _isPrimary, onChanged: (bool value){
              setState(() {
                _isPrimary = value;
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
    if(_addressNameEditingController.text.isNotEmpty
        && _buildingEditingController.text.isNotEmpty
        && _flatNumberEditingController.text.isNotEmpty
        && _streetEditingController.text.isNotEmpty
        && _isPrimary!=null
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
