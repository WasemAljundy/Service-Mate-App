import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/faq_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/faq.dart';
import 'package:gp_106_flutter_project/screens/faq/faq_details_screen.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';
import 'package:gp_106_flutter_project/widgets/faq_container.dart';


class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Faq Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: UsedColor.PRIMARY_COLOR,
        elevation: 0,
      ),
      body: FutureBuilder<List<Faq>>(
        future: FaqApiController().getFaqs(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const  Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData && snapshot.data !=null){
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FaqDetailsScreen(snapshot.data![index]),));
                  },
                    child: FaqContainer(snapshot.data![index]));
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemCount: snapshot.data!.length,
            );
          }else{
            return CardError();
          }
        },
      )
    );
  }

}

