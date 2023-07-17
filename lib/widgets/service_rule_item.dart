import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/service_rule.dart';

class ServiceRuleItem extends StatelessWidget {
  ServiceRule serviceRule;
  ServiceRuleItem({required this.serviceRule});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_sharp,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('payment_rule: ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Expanded(
                      child: Text(
                          serviceRule.paymentRule,
                          style:
                              TextStyle(color: primaryColors, fontSize: 18))),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_balance,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('perform_type: ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Expanded(
                      child: Text(
                          serviceRule.performType,
                          style:
                              TextStyle(color: primaryColors, fontSize: 18))),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Divider(
                height: 1,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                      child: Text('cost: ',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      '${serviceRule.cost}\$',
                      style: TextStyle(
                        color: primaryColors,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 5,
              ),
              serviceRule.performType == 'physical'?Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text(
                      'location: ',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      serviceRule.location,
                      style: TextStyle(
                        color: primaryColors,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ):SizedBox(height: 0,),
              const SizedBox(
                height: 5,
              ),
             serviceRule.performType == 'physical'? Row(
                children: [
                  Icon(
                    Icons.vertical_align_center,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text(
                      'lat: ',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      '${serviceRule.lat}',
                      style: TextStyle(
                        color: primaryColors,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ):SizedBox(height: 0,),
              const SizedBox(
                height: 5,
              ),
             serviceRule.performType == 'physical'? Row(
                children: [
                  Icon(
                    Icons.horizontal_rule,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text(
                      'long: ',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      '${serviceRule.long}',
                      style: TextStyle(
                        color: primaryColors,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ):SizedBox(height: 0,),
            ],
          ),
        ),
      ),
    );
  }
}
