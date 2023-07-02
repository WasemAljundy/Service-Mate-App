import 'package:flutter/material.dart';

import '../constent.dart';
import '../helpers/helpers.dart';
import '../widgets/text_field_refactor.dart';

class UpdateAddressScreen extends StatefulWidget {
  const UpdateAddressScreen({super.key});

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
    super.initState();
    _addressNameEditingController = TextEditingController();
    _buildingEditingController = TextEditingController();
    _flatNumberEditingController = TextEditingController();
    _streetEditingController = TextEditingController();
  }

  @override
  void dispose() {
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
        title: const Text('Address'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Update Address',
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
                value: _isPrimary,
                onChanged: (bool value) {
                  setState(() {
                    _isPrimary = value;
                  });
                }),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () =>performUpdate(),
              child: const Text(
                'Update',
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

  void update(){
    Navigator.pushNamed(context, '/profile_screen');
  }

  void performUpdate(){
    if(_checkData()){
      update();
    }
  }

}
