import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import '../../widgets/faq_container.dart';


class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});
  final String question = "what is your favorite color";
  final String service =  "color service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Faq Screen',
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: UsedColor.PRIMARY_COLOR,
        elevation: 0,
      ),
      body: SafeArea(
        child: Faq_widgets(question: question, service: service),
      ),
    );
  }

}

class Faq_widgets extends StatelessWidget {
  const Faq_widgets({
    super.key,
    required this.question,
    required this.service,
  });

  final String question;
  final String service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(width: 20,),
              FaqContainer(
                question: question,
                service_name: service,
                onPressed: (){},
              ),
            ],
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

