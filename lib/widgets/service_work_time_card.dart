import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/specialist.dart';
import 'package:gp_106_flutter_project/model/work_time.dart';

class ServiceWorkTimeCard extends StatelessWidget {
  WorkTime workTime;
  String serviceName;

  bool load;


  ServiceWorkTimeCard(
      {super.key, required this.workTime,
      required this.serviceName,required this.load});


   @override
  Widget build(BuildContext context) {
     return Container(
         margin: const EdgeInsetsDirectional.all(15),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(10),
           boxShadow: const [
             BoxShadow(
                 color: Colors.black45, offset: Offset(0, 3), blurRadius: 3),
           ],
         ),
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 15),
           child: Column(
             children: [
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     const  Expanded(
                         child: Text(
                           "Service specialist : ",
                           style:
                           TextStyle(color: Colors.grey, fontSize: 14),
                         )),
                     Expanded(child: Text('not found'
                     )),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     const Expanded(
                         child: Text(
                           "Service name        : ",
                           style:
                           TextStyle(color: Colors.grey, fontSize: 14),
                         )),
                     Expanded(child: Text(serviceName)),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     const Expanded(
                         child: Text(
                           "Service day            : ",
                           style:
                           TextStyle(color: Colors.grey, fontSize: 14),
                         )),
                     Expanded(child: Text(workTime.day)),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     const Expanded(
                         child: Text(
                           "Service start time : ",
                           style:
                           TextStyle(color: Colors.grey, fontSize: 14),
                         )),
                     Expanded(child: Text(workTime.fromTime)),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     const Expanded(
                         child: Text(
                           "Service end time  : ",
                           style:
                           TextStyle(color: Colors.grey, fontSize: 14),
                         )),
                     Expanded(child: Text(workTime.toTime)),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     const Expanded(
                         child: Text(
                           "Service type          : ",
                           style:
                           TextStyle(color: Colors.grey, fontSize: 14),
                         )),
                     Expanded(child: Text(workTime.type)),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     TextButton(
                       child: const Text('GET APPOINTMENT'),
                       onPressed: () {/* ... */},
                     ),
                     const Spacer(),
                     TextButton(
                       child: const Text('LEARN MORE'),
                       onPressed: () {/* ... */},
                     )
                   ],
                 ),
               )
             ],
           ),
         ));
   }
   }


//   @override
//   Widget build(BuildContext context) {
//     return  load ?FutureBuilder<Specialist>(
//       future: ServiceApiController().showSpecialist(id: workTime.specialistId),
//       builder: (context, snapshot) {
//         if(snapshot.connectionState ==ConnectionState.waiting){
//           return Center(child: CircularProgressIndicator(),);
//         }else if(snapshot.hasData && snapshot.data!=null){
//           return Container(
//               margin: const EdgeInsetsDirectional.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: const [
//                   BoxShadow(
//                       color: Colors.black45, offset: Offset(0, 3), blurRadius: 3),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const  Expanded(
//                               child: Text(
//                                 "Service specialist : ",
//                                 style:
//                                 TextStyle(color: Colors.grey, fontSize: 14),
//                               )),
//                           Expanded(child: Text(snapshot.data!.fullName
//                           )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Expanded(
//                               child: Text(
//                                 "Service name        : ",
//                                 style:
//                                 TextStyle(color: Colors.grey, fontSize: 14),
//                               )),
//                           Expanded(child: Text(serviceName)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Expanded(
//                               child: Text(
//                                 "Service day            : ",
//                                 style:
//                                 TextStyle(color: Colors.grey, fontSize: 14),
//                               )),
//                           Expanded(child: Text(workTime.day)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Expanded(
//                               child: Text(
//                                 "Service start time : ",
//                                 style:
//                                 TextStyle(color: Colors.grey, fontSize: 14),
//                               )),
//                           Expanded(child: Text(workTime.fromTime)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Expanded(
//                               child: Text(
//                                 "Service end time  : ",
//                                 style:
//                                 TextStyle(color: Colors.grey, fontSize: 14),
//                               )),
//                           Expanded(child: Text(workTime.toTime)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Expanded(
//                               child: Text(
//                                 "Service type          : ",
//                                 style:
//                                 TextStyle(color: Colors.grey, fontSize: 14),
//                               )),
//                           Expanded(child: Text(workTime.type)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextButton(
//                             child: const Text('GET APPOINTMENT'),
//                             onPressed: () {/* ... */},
//                           ),
//                           const Spacer(),
//                           TextButton(
//                             child: const Text('LEARN MORE'),
//                             onPressed: () {/* ... */},
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ));
//         }else{
//           return Text('eee');
//         }
//       },
//     ):Center(child: Text('FUCK'),);
//   }
// }
//

