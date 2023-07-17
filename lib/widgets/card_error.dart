import 'package:flutter/material.dart';
class CardError extends StatelessWidget {
  const CardError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              color: Colors.grey.shade300,
              size: 60,
            ),
            Text('NO DATA',
                style: TextStyle(
                    color: Colors.grey.shade300, fontSize: 30)),
          ],
        ));
  }
}