import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constent.dart';
import '../helpers/helpers.dart';
import '../widgets/text_field_refactor.dart';

class UpdateDataKeysScreen extends StatefulWidget {
  const UpdateDataKeysScreen({super.key});

  @override
  State<UpdateDataKeysScreen> createState() => _UpdateDataKeysScreenState();

}


class _UpdateDataKeysScreenState extends State<UpdateDataKeysScreen> with Helpers{



  late bool _isActive = false;
  late bool _isRequired = false;
  String _gender = 'Male';
  late TextEditingController _infoEditingController;


  @override
  void initState() {
    super.initState();
    _infoEditingController = TextEditingController();

  }


  @override
  void dispose() {
    _infoEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Keys'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 30,),
            const Text(
              'Update Data Keys',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            TextFieldRefactor(controller: _infoEditingController, prefixIcon: Icons.info, label: 'Enter Info'),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    activeColor: primaryColors,
                    title: const Text('Male'),
                    contentPadding: EdgeInsets.zero,
                    value: 'M',
                    groupValue: _gender,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _gender = value;
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    activeColor: primaryColors,
                    title: const Text('Female'),
                    contentPadding: EdgeInsets.zero,
                    value: 'F',
                    groupValue: _gender,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _gender = value;
                        });
                      }
                    },
                  ),
                )

              ],
            ),
            const SizedBox(height: 10,),
            SwitchListTile(
              activeColor: HexColor('#4B989C'),
              title: const Text(
                'Active',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              value: _isActive,
              onChanged: (bool value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),
            const SizedBox(height: 10,),
            SwitchListTile(
              activeColor: HexColor('#4B989C'),
              title: const Text(
                'Required',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              value: _isRequired,
              onChanged: (bool value) {
                setState(() {
                  _isRequired = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                perFormUpdate();
              },

              child: const Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }




  bool _checkData(){
    if(_infoEditingController.text.isNotEmpty
        &&_gender.isNotEmpty
    )
    {
      return true;
    }else{
      showSnackBar(context: context, message: 'Enter Required data!',error: true);
      return false;
    }

  }
  void perFormUpdate(){
    if(_checkData()){
      update();
    }
  }

  void update(){

  }

}