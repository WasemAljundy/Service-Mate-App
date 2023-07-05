import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          Text(
            faq.question,
            style: TextStyle(color: Colors.black, fontSize: 24, overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
          Text('more info')
        ],
      ),
    );
  }
}
