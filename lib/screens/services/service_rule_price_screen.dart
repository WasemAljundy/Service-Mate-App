import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/service_api_controller.dart';
import 'package:gp_106_flutter_project/model/service_rule_price.dart';
import 'package:gp_106_flutter_project/screens/services/service_work_time_screen.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';
import 'package:gp_106_flutter_project/widgets/service_rule_price_item.dart';

class ServiceRulePriceScreen extends StatefulWidget {
  ServiceRulePriceScreen(
      {super.key, required this.serviceId, required this.serviceRuleID});

  int serviceId;
  int serviceRuleID;

  @override
  State<ServiceRulePriceScreen> createState() => _ServiceRulePriceScreenState();
}

class _ServiceRulePriceScreenState extends State<ServiceRulePriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('service rule price details'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<ServiceRulePrice>>(
          future: ServiceApiController()
              .getServiceRulePrices(serviceRuleId: widget.serviceRuleID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ServiceWorkTimeScreen(
                              price:snapshot.data![index].newPrice,
                              serviceId: widget.serviceId,
                              serviceRuleId: widget.serviceRuleID,
                              serviceRulePriceId: snapshot.data![index].id);
                        },
                      ));
                    },
                    child: ServiceRulePriceItem(
                        serviceRulePrice: snapshot.data![index]),
                  );
                },
                itemCount: snapshot.data!.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
              );
            } else {
              return const CardError();
            }
          },
        ));
  }
}
