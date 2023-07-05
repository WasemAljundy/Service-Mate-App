import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/attachment.dart';


class AttachmentItem extends StatelessWidget {

  Attachment attachment;

  AttachmentItem(this.attachment, {super.key});



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsetsDirectional.only(bottom: 15),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(attachment.name, style: const TextStyle(
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
                color: Colors.black45), maxLines: 1,),
            Text(attachment.status, style: const TextStyle(
                color: Colors.black54, fontSize: 16),),
            Text(attachment.date, style: const TextStyle(
                fontSize: 12, color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}

