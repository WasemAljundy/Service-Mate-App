import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/service_rule.dart';
import 'package:gp_106_flutter_project/model/service_rule_price.dart';

class ServiceRulePriceItem extends StatelessWidget {
  ServiceRulePrice serviceRulePrice;
  ServiceRulePriceItem({required this.serviceRulePrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.all(20),
      
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
                  const Text('new_price: ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Expanded(
                      child: Text(
                          '${serviceRulePrice.newPrice}',
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
                  const Text('old_price:   ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Expanded(
                      child: Text(
                          '${serviceRulePrice.oldPrice}',
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
              Text('details : ',style: TextStyle(color: Colors.grey,fontSize: 14),),
                const SizedBox(
                height: 5,
              ),
              Text(serviceRulePrice.details,style: TextStyle(color: primaryColors,fontSize: 16),),
                const SizedBox(
                height: 30,
              ),

              Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.arrow_forward,size: 22,color: primaryColors,),
                const SizedBox(
                width: 5,
              ),
                Text('Working Hours',style: TextStyle(color: primaryColors,fontSize: 18),),

              ],)

            ],
          ),
        ),
      ),
    );
  }
}
