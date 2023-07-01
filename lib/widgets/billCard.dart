import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  BillCard({
    required this.billNumber,
    required this.dateTime,
    required this.amount,
    required this.details,
    required this.discount,
    required this.reservationId,
    super.key,
  });

  late int billNumber;
  late String dateTime;
  late int amount;
  late String details;
  late int discount;
  late int reservationId;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Bill Number ',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  billNumber.toString(),
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Date Time',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  dateTime,
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Amount',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  amount.toString(),
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Discount',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  discount.toString(),
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