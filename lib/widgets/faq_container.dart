import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/faq.dart';

class FaqContainer extends StatelessWidget {

  Faq faq;
  FaqContainer(this.faq);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              faq.question,
              style: TextStyle(color: UsedColor.PRIMARY_COLOR, fontSize: 18, overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),
            SizedBox(height: 10,),
            Align(alignment: AlignmentDirectional.bottomEnd,child: Text('more info',style: TextStyle(color:Colors.grey),))
          ],
        ),
      ),
    );
  }
}
