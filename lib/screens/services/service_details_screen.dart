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
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child:Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Image.network(service.image,
                          width: double.infinity,height: 250,fit: BoxFit.cover,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 45,
                            width: 45,
                            ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text('Short Description: ',style: TextStyle(color: Colors.black45,fontSize: 18, fontWeight: FontWeight.bold)),
                      Container(child:
                      Text(service.shortDescription
                          ,style: TextStyle(color: Colors.black54,fontSize: 14))),
                      SizedBox(height: 20,),
                      Text('Long Description',style: TextStyle(color: Colors.black54,fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5,),
                      Text(service.longDescription,
                          style: TextStyle(color: Colors.grey,fontSize: 14)),

                    ],
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}
