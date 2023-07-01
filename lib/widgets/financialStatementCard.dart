import 'package:flutter/material.dart';

class FinancialStatementCard extends StatelessWidget {
  FinancialStatementCard({
    required this.details,
    required this.paymentDate,
    required this.paidAmount,
    required this.remains,
    required this.paymentMethod,
    super.key,
  });

  late String details;
  late String paymentDate;
  late int paidAmount;
  late int remains;
  late String paymentMethod;


  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Details ',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  details,
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Payment Date',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  paymentDate,
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Paid Amount',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  paidAmount.toString(),
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Remains',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  remains.toString(),
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Payment Method',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  paymentMethod,
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}