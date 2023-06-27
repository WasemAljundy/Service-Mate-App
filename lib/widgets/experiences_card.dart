import 'package:flutter/material.dart';

class ExperiencesCard extends StatefulWidget {

  const ExperiencesCard({
    super.key,
    required this.experience_name,
    this.onPressed,
    this.marginBottom = 0,
    required this.from_time,
    required this.to_time,
  });

  final String experience_name;
  final String from_time;
  final String to_time;
  final double marginBottom;
  final void Function()? onPressed;

  @override
  State<ExperiencesCard> createState() => _ExperiencesCardState();
}

class _ExperiencesCardState extends State<ExperiencesCard> {
  bool _isShown = true;

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
                  Expanded(child: Text("experience name : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(widget.experience_name)),

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
                  Expanded(child: Text(widget.from_time)),

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
                  Expanded(child: Text(widget.to_time)),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  TextButton(
                    child: const Text('UPDATE' ),
                    onPressed: () {/* ... */},
                  ),
                  Spacer(),
                  TextButton(
                    child: const Text('DELETE'),
                    onPressed: () {_delete(context);},
                  ),
                  Spacer(),

                ],
              ),
            )


          ],
        ),
      )
    );
  }

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
            title: const Text('Delete Confirm'),
            content: const Text('Are you sure to delete it ?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    setState(() {
                      _isShown = false;
                    });

                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
}
