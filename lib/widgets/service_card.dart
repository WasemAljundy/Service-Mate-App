
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:gp_106_flutter_project/screens/services/service_details_screen.dart';
import 'package:gp_106_flutter_project/screens/services/service_work_time_screen.dart';

class ServiceCard extends StatelessWidget {   Service service;


ServiceCard({super.key, required this.service});


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
                child: SizedBox(
                  height: 100.0,
                  child: Image.network(service.image,fit: BoxFit.cover,),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Text(service.name),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(service.shortDescription),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text(''),
                  onPressed: () {
                  },
                ),
                const Spacer(),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: ()async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailsScreen(service.id),),);
                  },
                )
              ],
            ),
          )
        ],
      ));
}
}