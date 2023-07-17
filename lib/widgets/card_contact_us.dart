import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/contact_us_request.dart';

class CardContactUs extends StatelessWidget {

  ContactUsRequest contactUsRequest;


  CardContactUs(this.contactUsRequest);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('subject'),
          subtitle: Text(contactUsRequest.subject),
          trailing: Icon(Icons.arrow_forward_ios),

        ),
        SizedBox(height: 5,),
        Divider( color: Colors.grey[250],height: 1,endIndent: 10,indent: 10,),
        SizedBox(height: 10,),
      ],
    );
  }
}
