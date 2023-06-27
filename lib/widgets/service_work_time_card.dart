import 'package:flutter/material.dart';

class ServiceWorkTimeCard extends StatelessWidget {
  const ServiceWorkTimeCard({
    super.key,
    required this.specialist,
    required this.type,
    this.onPressed,
    this.marginBottom = 0,
    required this.day,
    required this.from_time,
    required this.to_time,
  });

  final String specialist;
  final String type;
  final String day;
  final String from_time;
  final String to_time;
  final double marginBottom;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black45, offset: Offset(0, 3), blurRadius: 3),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Text("Service specialist : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(specialist)),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Text("Service day            : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(day)),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Text("Service start time : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(from_time)),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Text("Service end time  : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(to_time)),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Text("Service type          : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(type)),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child: const Text('GET APPOINTMENT' ),
                    onPressed: () {/* ... */},
                  ),
                  Spacer(),
                  TextButton(
                    child: const Text('LEARN MORE'),
                    onPressed: () {/* ... */},
                  )
                ],
              ),
            )


          ],
        ),
      )
    );
  }
}
