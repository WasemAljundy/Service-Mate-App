import 'package:flutter/material.dart';

class FaqContainer extends StatelessWidget {
  const FaqContainer({
    super.key,
    required this.question,
    required this.service_name,
    required this.onPressed,
    this.marginBottom = 0,
  });

  final String question;
  final String service_name;
  final double marginBottom;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: 10,
        end: 10,
        bottom: marginBottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black45, offset: Offset(0, 3), blurRadius: 3),
        ],
      ),
      child: ListTile(
        title: Text(question),
        subtitle: Text(service_name),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
