
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/service_api_controller.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';

import '../../constent.dart';
import '../../widgets/service_card.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Service Screen"),
          backgroundColor: UsedColor.PRIMARY_COLOR,
        ),
        body: FutureBuilder<List<Service>>(
          future: ServiceApiController().getServices(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const  Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasData && snapshot.data !=null){

              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ServiceCard(service: snapshot.data![index]);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  );
                }, itemCount: snapshot.data!.length,
              );
            }else{
              return const CardError();
            }
          },
        )
    );
  }
}
