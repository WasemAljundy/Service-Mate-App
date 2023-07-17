// import 'package:flutter/material.dart';
// import 'package:gp_106_flutter_project/constent.dart';
// import 'package:gp_106_flutter_project/get/attachment_get_controller.dart';
// import 'package:gp_106_flutter_project/model/attachment.dart';
// import 'package:gp_106_flutter_project/screens/attachment_details_screen.dart';
// import 'package:gp_106_flutter_project/screens_keys.dart';
// import 'package:gp_106_flutter_project/widgets/attachment_item.dart';
// import 'package:get/get.dart';
// import 'package:gp_106_flutter_project/widgets/card_error.dart';

// class AttachmentsScreen extends StatelessWidget {
//   AttachmentsScreen({Key? key}) : super(key: key);

//   final AttachmentGetXController _attachmentGetXController =
//       Get.put<AttachmentGetXController>(AttachmentGetXController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColors,
//         title: const Text('Attachments'),
//         centerTitle: true,
//       ),
//       body: GetBuilder<AttachmentGetXController>(
//         builder: (controller) {
//           if (controller.load) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (controller.attachments.isNotEmpty) {
//             return ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: controller.attachments.length,
//               physics: const BouncingScrollPhysics(),
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemBuilder: (context, index) => GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AttachmentDetailsScreen(
//                               controller.attachments[index]),
//                         ));
//                   },
//                   child: AttachmentItem(controller.attachments[index])),
//             );
//           } else {
//             return const CardError();
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, ScreenKeys.addAttachmentScreen);
//         },
//         backgroundColor: primaryColors,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
