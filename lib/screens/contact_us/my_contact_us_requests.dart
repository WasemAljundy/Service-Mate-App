import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/getx/contact_us_get_controller.dart';
import 'package:gp_106_flutter_project/screens/contact_us/contact_us_details.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:gp_106_flutter_project/widgets/card_contact_us.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';

class MyContactUsRequests extends StatelessWidget {
   MyContactUsRequests({Key? key}) : super(key: key);

  final ContactUsGetXController _getXController = Get.put(ContactUsGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text('contact us'),),
      body: GetBuilder<ContactUsGetXController>(
        builder:(controller) {
         if(controller.load){
           return const Center(child: CircularProgressIndicator(),);
         }else if(controller.contactUsRequests.isNotEmpty){
          return  ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) =>ContactUsDetails(id: controller.contactUsRequests[index].id,))) ,
                child:CardContactUs(controller.contactUsRequests[index]),
              );
            },
            itemCount: controller.contactUsRequests.length,
            physics: const BouncingScrollPhysics(),
          );
         }else{
           return const CardError();
         }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, ScreenKeys.createContactUs);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



