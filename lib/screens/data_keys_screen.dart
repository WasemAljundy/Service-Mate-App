import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/widgets/data_keys_card.dart';
import 'package:hexcolor/hexcolor.dart';
class DataKeysScreen extends StatefulWidget {
  const DataKeysScreen({super.key});

  @override
  State<DataKeysScreen> createState() => _DataKeysScreenState();
}

class _DataKeysScreenState extends State<DataKeysScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#4B989C'),
        title: const Text('Data Keys'),
        centerTitle: true,
      ),

      body:  ListView(
        children: const [
           Column(
            children: [
             DataKeysCard(value: 'value',dataType: 'dataType',info: 'info',type: 'type', gender: 'Male',active: true,required: false,),
             DataKeysCard(value: 'value',dataType: 'dataType',info: 'info',type: 'type', gender: 'Male',active: true,required: false,),
             DataKeysCard(value: 'value',dataType: 'dataType',info: 'info',type: 'type', gender: 'Male',active: true,required: false,),

            ],
          ),
        ],
      ),
    );
  }
}
