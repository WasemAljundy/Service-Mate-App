import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/service_api_controller.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:gp_106_flutter_project/model/work_time.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';

import '../../constent.dart';
import '../../widgets/service_card.dart';
import '../../widgets/service_work_time_card.dart';

class ServiceWorkTimeScreen extends StatelessWidget {

  final int serviceId;
  int serviceRuleId;
  int serviceRulePriceId;
  int price;



  ServiceWorkTimeScreen({ required this.serviceId,required this.serviceRuleId,
    required this.serviceRulePriceId,required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work Times"),
        backgroundColor: UsedColor.PRIMARY_COLOR,
      ),
      body: FutureBuilder<List<WorkTime>>(
        future: ServiceApiController().getServiceWorkTimes(serviceId: serviceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasData && snapshot.data != null) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ServiceWorkTimeCard(
                  workTime: snapshot.data![index],
                  serviceId: serviceId,
                  serviceRuleId: serviceRuleId,
                  serviceRulePriceId:serviceRulePriceId,
                  price:price,
                );
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
          } else {
            return CardError();
          }
        },
      ),
    );
  }
}
