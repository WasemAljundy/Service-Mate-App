
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/service_api_controller.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:gp_106_flutter_project/screens/services/service_details_screen.dart';
import 'package:gp_106_flutter_project/screens/services/service_work_time_screen.dart';

class ServiceCard extends StatelessWidget {   @override



Service service;
int id;


ServiceCard({required this.service, required this.id});


@override
Widget build(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100.0,
                  child: Image.network(service.image,fit: BoxFit.cover,),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(service.name),
                  trailing: Icon(Icons.favorite_outline),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(service.shortDescription),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('GET APPOINTMENT'),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceWorkTimeScreen(serviceId: service.id,serviceName: service.name,),));
                  },
                ),
                Spacer(),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: ()async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailsScreen(service),));
                  },
                )
              ],
            ),
          )
        ],
      ));
}
}