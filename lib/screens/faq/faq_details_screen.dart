import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/faq.dart';

import '../../constent.dart';


class FaqDetailsScreen extends StatelessWidget {

  Faq faq;

  FaqDetailsScreen(this.faq);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: UsedColor.PRIMARY_COLOR,
          title: const  Text('FAQ Details'),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      const Text('Question: ',style: TextStyle(color: Colors.black45,fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(faq.question,style: const TextStyle(color: Colors.black54,fontSize: 14)),
                      const SizedBox(height: 20,),
                      const Text('Answer',style: TextStyle(color: Colors.black54,fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5,),
                      Text(faq.answer,
                          style: const TextStyle(color: Colors.grey,fontSize: 14)),

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
