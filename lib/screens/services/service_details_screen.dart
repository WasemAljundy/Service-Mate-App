import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/service.dart';

import '../../constent.dart';


class ServiceDetailsScreen extends StatelessWidget {

  final Service service;

  ServiceDetailsScreen(this.service);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: const  Text('Service details'),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(service.image,
                  width: double.infinity,height: 250,fit: BoxFit.fill,),
                const SizedBox(height: 10,),
                const Text('Short Description: ',style: TextStyle(color: Colors.black45,fontSize: 18, fontWeight: FontWeight.bold)),
                Text(service.shortDescription,style: const TextStyle(color: Colors.black54,fontSize: 14)),
                const SizedBox(height: 20,),
                const Text('Long Description',style: TextStyle(color: Colors.black54,fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5,),
                Text(service.longDescription,
                    style: const TextStyle(color: Colors.grey,fontSize: 14)),
              ],
            ),
          ),
        )
    );
  }
}
