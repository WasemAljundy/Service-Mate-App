import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../helpers/helpers.dart';
import '../widgets/text_field_refactor.dart';

      class UpdateDataScreen extends StatefulWidget {
        const UpdateDataScreen({super.key});

        @override
        State<UpdateDataScreen> createState() => _UpdateDataScreenState();

      }


      late TextEditingController _dataTypeController;
      late TextEditingController _dataValueController;




      class _UpdateDataScreenState extends State<UpdateDataScreen> with Helpers {

        @override
        void initState() {
          super.initState();
          _dataTypeController = TextEditingController();
          _dataValueController = TextEditingController();
        }


        @override
        void dispose() {
          _dataTypeController.dispose();
          _dataValueController.dispose();
          super.dispose();
        }
        @override
        Widget build(BuildContext context) {
          return  Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back_ios_new),
              backgroundColor: HexColor('#4B989C'),
              title: const Text(' update data'),
              centerTitle: true,
            ),
            body: Padding(
              padding:  const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const  SizedBox(height: 40),
                  const Text(
                    'Update Data',
                    style: TextStyle(
                      color: Color(0Xff4B989C) ,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  TextFieldRefactor(controller:_dataValueController,prefixIcon: Icons.access_time_filled,label: 'value data',type: TextInputType.text, ),
                  const  SizedBox(height: 20),
                  TextFieldRefactor(controller:_dataTypeController,prefixIcon: Icons.type_specimen,label: 'type data',type: TextInputType.text, ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: (){
                    performUpdate();
                  },
                    child: const Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),

                    ),
                  ),
                ],
              ),
            ),
          );
        }




        bool _checkData(){
          if(_dataValueController.text.isNotEmpty
              && _dataTypeController.text.isNotEmpty)
          {
            return true;
          }else{
            showSnackBar(context: context, message: 'Enter Required data!',error: true);
            return false;
          }
        }

        void performUpdate(){
          if(_checkData()){
            update();
          }
        }

        void update(){

        }


      }


