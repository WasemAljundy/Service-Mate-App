import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/contact_us_request_reply.dart';

class CardContactUsReply extends StatelessWidget {
  ContactUsRequestReply contactUsRequestReply;
  CardContactUsReply(this.contactUsRequestReply);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          clipBehavior: Clip.antiAlias,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: ClipOval(
            child: Image.network(
              contactUsRequestReply.specialist!.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsetsDirectional.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contactUsRequestReply.specialist!.fullName),
                  Text(contactUsRequestReply.specialist!.jobTitle),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'reply',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    contactUsRequestReply.reply,
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

/*
Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsetsDirectional.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  clipBehavior: Clip.antiAlias,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: ClipOval(
                    child: Image.network(contactUsRequestReply.specialist!.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contactUsRequestReply.specialist!.fullName),
                      Text(contactUsRequestReply.specialist!.jobTitle),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15,),
            const Text('reply',style: TextStyle(color: Colors.grey),),
            Text(contactUsRequestReply.reply,style: TextStyle(color: Colors.black54),)
          ],
        ),
      ),
    );
 */