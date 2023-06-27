 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constent.dart';
import '../../widgets/service_card.dart';
import '../../widgets/service_work_time_card.dart';

class ServiceWorkTime extends StatelessWidget {
     const ServiceWorkTime({super.key});
      final String serviceName = "Service Name ";
     @override
     Widget build(BuildContext context) {
       return  Scaffold(
         appBar: AppBar(
           title: Text("$serviceName Work Time"),
           backgroundColor: UsedColor.PRIMARY_COLOR,
         ),
         body: ListView.separated(
           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
           scrollDirection: Axis.vertical,
           itemBuilder: (context, index) {
             return ServiceWorkTimeCard(specialist: "specialist",
               day: "Monday",
               from_time: "03-06-2023-08:00",
               to_time: "03-06-2023-010:00",
               type: "online",
             );
           },
           separatorBuilder: (context, index) {
             return const Divider(
               thickness: 1,
               indent: 20,
               endIndent: 20,
             );
           }, itemCount: 5,
         ),
       );


     }
   }



