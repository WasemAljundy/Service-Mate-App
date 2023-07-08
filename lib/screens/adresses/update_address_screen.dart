import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/get/address_get_controller.dart';
import 'package:gp_106_flutter_project/model/addresses.dart';
import 'package:gp_106_flutter_project/widgets/text_field_refactor.dart';

import '../../constent.dart';
import '../../helpers/helpers.dart';

class UpdateAddressScreen extends StatefulWidget {

  Address address;
  UpdateAddressScreen(this.address, {super.key});

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}



class _UpdateAddressScreenState extends State<UpdateAddressScreen> with Helpers{

  late TextEditingController _addressNameEditingController;
  late TextEditingController _buildingEditingController;
  late TextEditingController _flatNumberEditingController;
  late TextEditingController _streetEditingController;

  bool _isPrimary = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addressNameEditingController = TextEditingController(text:widget.address.name);
    _buildingEditingController = TextEditingController(text:widget.address.building);
    _flatNumberEditingController = TextEditingController(text:widget.address.flatId.toString());
    _streetEditingController = TextEditingController(text:widget.address.street);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('update Address'),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Create Address',
              style: TextStyle(
                color: Color(0Xff4B989C),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFieldRefactor(
                controller: _addressNameEditingController,
                prefixIcon: Icons.account_balance_outlined,
                label: 'Address Name',
                type: TextInputType.text),
            const SizedBox(height: 20),
            TextFieldRefactor(
                controller: _buildingEditingController,
                prefixIcon: Icons.location_city_rounded,
                label: 'building Name',
                type: TextInputType.text),
            const SizedBox(height: 20),
            TextFieldRefactor(
                controller: _streetEditingController,
                prefixIcon: Icons.streetview_outlined,
                label: 'street Name',
                type: TextInputType.text),
            const SizedBox(height: 20),
            TextFieldRefactor(
                controller: _flatNumberEditingController,
                prefixIcon: Icons.account_balance_outlined,
                label: 'Flat Number',
                type: TextInputType.number),
            const SizedBox(height: 20),
            SwitchListTile(
                activeColor: primaryColors,
                title: const Text(
                  'Primary',
                  style: TextStyle(fontSize: 18),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                value:_isPrimary,
                onChanged: (bool value) {
                  setState(() {
                    _isPrimary = value;
                  });
                }),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: ()async  => await performUpdateAddress(),
              child: const Text(
                'Update Address',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _checkData() {
    if (_addressNameEditingController.text.isNotEmpty &&
        _buildingEditingController.text.isNotEmpty &&
        _flatNumberEditingController.text.isNotEmpty &&
        _streetEditingController.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(context: context, message: 'Enter required data',error: true);
      return false;
    }
  }


  Future<void> updateAddress()async{
    AddressGetXController.to.updateAddress(id: widget.address.id,addressModel: addressModel, context: context, callBack: ({Address? address, required String message,required bool status}) {
      if(status){
        showSnackBar(context: context, message: message);
        Navigator.pop(context);
      }else{
        print(message);
        showSnackBar(context: context, message: message,error: true);
      }
    },);
  }

  Future<void> performUpdateAddress()async{
    if (_checkData()) {
      await  updateAddress();
    }
  }


  Address get addressModel {
    Address a = Address();
    a.building = _buildingEditingController.text;
    a.flatId = int.parse(_flatNumberEditingController.text,radix: 16);
    a.street = _streetEditingController.text;
    a.name = _addressNameEditingController.text;
    a.primary = _isPrimary?'1':'0';
    return a;
  }

}