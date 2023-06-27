import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/bill.dart';
import 'package:gp_106_flutter_project/model/financial_statement.dart';
import 'package:gp_106_flutter_project/widgets/billCard.dart';
import 'package:gp_106_flutter_project/widgets/financialStatementCard.dart';
import 'package:gp_106_flutter_project/constent.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final List<Bill> _bills = <Bill>[
    Bill(
      billNumber: 123456789,
      dateTime: '14/06/2002',
      amount: 1000,
      details: 'First Bill Details',
      discount: 50,
      reservationId: 1,
    ),
    Bill(
      billNumber: 987654321,
      dateTime: '26/06/2023',
      amount: 3000,
      details: 'Second Bill Details',
      discount: 150,
      reservationId: 2,
    ),
  ];

  final List<FinancialStatement> _financialStatement = <FinancialStatement>[
    FinancialStatement(
      details: 'Financial Statement Details',
      paymentDate: '01/01/2023',
      paidAmount: 500,
      remains: 1000,
      paymentMethod: 'Visa Card',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColors,
      ),
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 225,
            decoration: const BoxDecoration(
              color: Color(0xff4b989c),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(300),
                bottomRight: Radius.circular(300),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 40,
                  child: Image.asset(
                    'images/bill.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Total Bills Amount',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ' 5000💲',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _bills.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                tilePadding: const EdgeInsets.only(left: 20, bottom: 20),
                childrenPadding: const EdgeInsets.only(bottom: 20),
                title: BillCard(
                  billNumber: _bills[index].billNumber,
                  dateTime: _bills[index].dateTime,
                  amount: _bills[index].amount,
                  details: _bills[index].details,
                  discount: _bills[index].discount,
                  reservationId: _bills[index].reservationId,
                ),
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _financialStatement.length,
                    itemBuilder: (context, index) {
                      return FinancialStatementCard(
                          details: _financialStatement[index].details,
                          paymentDate: _financialStatement[index].paymentDate,
                          paidAmount: _financialStatement[index].paidAmount,
                          remains: _financialStatement[index].remains,
                          paymentMethod:
                              _financialStatement[index].paymentMethod);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
