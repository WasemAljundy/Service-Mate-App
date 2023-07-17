import 'package:flutter/material.dart';

class DataKeysCard extends StatefulWidget {

  const DataKeysCard({
    super.key,
    required this.dataType,
    required this.value,
    required this.info,
    required this.gender,
    required this.type,
    this.required,
    this.active,
    this.onPressed,
    this.marginBottom = 0,


  });
  final String dataType;
  final String value;
  final String info;
  final String type;
  final String gender;
  final bool? required;
  final bool? active;
  final double marginBottom;
  final void Function()? onPressed;

  @override
  State<DataKeysCard> createState() => _DataKeysCardState();
}

class _DataKeysCardState extends State<DataKeysCard> {
  bool _isShown = true;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsetsDirectional.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(color: Colors.black45, offset: Offset(0, 3), blurRadius: 3),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(child: Text("Data Type : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(widget.dataType)),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(child: Text("Value : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(widget.value)),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(child: Text("Info : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(widget.info)),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(child: Text("Type : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(widget.type)),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(child: Text("Gender : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text(widget.gender)),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(child: Text("Required : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text('${widget.required}')),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(child: Text("Active : " , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ) ,)),
                  Expanded(child: Text('${widget.active}')),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  TextButton(
                    child: const Text('UPDATE' ),
                    onPressed: () {/* ... */},
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text('DELETE'),
                    onPressed: () {_delete(context);},
                  ),
                  const Spacer(),

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
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Delete Confirm'),
          content: const Text('Are you sure you want to delete it?'),
          actions: [
            // The "Yes" button
            TextButton(
              onPressed: () {
                setState(() {
                  _isShown = false;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

}
