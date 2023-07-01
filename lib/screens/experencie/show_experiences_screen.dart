 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/api_controller/api_controller.dart';
import 'package:gp_106_flutter_project/api/api_controller/get.dart';
import 'package:gp_106_flutter_project/model/experience.dart';
import 'package:gp_106_flutter_project/widgets/experiences_card.dart';

import '../../constent.dart';

class ShowExperiencesScreen extends StatelessWidget {
     const ShowExperiencesScreen({super.key});

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           backgroundColor: UsedColor.PRIMARY_COLOR,
           title: const  Text('Show Experiences'),
           centerTitle: true,
         ),
         body: FutureBuilder<List<Experience>>(
           future: ApiController.get.getExperience(),
           builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return const Center(child: CircularProgressIndicator());
             } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ExperiencesCard(
                        experience_name: snapshot.data![index].experienceName,
                        from_time: snapshot.data![index].fromDate,
                        to_time: snapshot.data![index].toDate);
                  },
                 separatorBuilder: (context, index) {
                   return const Divider(
                     thickness: 1,
                     indent: 20,
                     endIndent: 20,
                   );
                 },
               );
             } else {
               return const Center(
                 child: Text(
                   'NO DATA',
                   style: TextStyle(
                     fontSize: 28,
                     fontWeight: FontWeight.bold,
                     color: Colors.black45,
                   ),
                 ),
               );
             }
           },
         ),
       );
     }
}




   //     return  FutureBuilder<List<Experience>>(
   //       future: ApiController().get.getExperience(),
   //       builder: (context, snapshot) {
   //         if(snapshot.connectionState == ConnectionState.waiting){
   //           return const Center(child: CircularProgressIndicator());
   //
   //         }
   //         else if (snapshot.hasData && snapshot.data!.isNotEmpty){
   //           return ListView.separated(
   //             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
   //             scrollDirection: Axis.vertical,
   //             itemBuilder: (context, index) {
   //               return ExperiencesCard(experience_name: "experience_name",
   //                   from_time: "12/06/2023",
   //                   to_time: "12/07/2023");
   //             },
   //             separatorBuilder: (context, index) {
   //               return const Divider(
   //                 thickness: 1,
   //                 indent: 20,
   //                 endIndent: 20,
   //               );
   //             }, itemCount: 5,
   //           ),
   //       }
   //       },
   //     ),
   //
   //
   //   }
   //
   // }
   //
   //
   //
