import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/get/address_get_controller.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:gp_106_flutter_project/widgets/address_card.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';

class AddressesScreen extends StatelessWidget {
   AddressesScreen({Key? key}) : super(key: key);

  final AddressGetXController _getXController=Get.put(AddressGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('addresses screen'),
      ),
      body: GetBuilder<AddressGetXController>(
        builder: (controller) {
          if(controller.load){
            return const Center(child:  CircularProgressIndicator());
          }else if(controller.addresses.isNotEmpty){
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return AddressCard(controller.addresses[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemCount:controller.addresses.length,
            );
          }else{
            print('controller.addresse : is ${controller.addresses.length}');
            return CardError();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, ScreenKeys.addAddressScreen);
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
