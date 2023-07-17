import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/getx/address_get_controller.dart';
import 'package:gp_106_flutter_project/model/addresses.dart';
import 'package:gp_106_flutter_project/screens/adresses/update_address_screen.dart';

class AddressCard extends StatelessWidget {

  Address address;

  AddressCard(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 15,start: 15,end: 15),
        margin: const EdgeInsetsDirectional.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45, offset: Offset(0, 3), blurRadius: 3),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: Text(
                    "Address Name",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                Expanded(child: Text(address.name )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                    child: Text(
                      "Address Building        : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                Expanded(child: Text(address.building)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                    child: Text(
                      "Flat id           : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                Expanded(child: Text('${address.flatId}')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                    child: Text(
                      "Address Street: ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                Expanded(child: Text(address.street)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                    child: Text(
                      "Primary  : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                Expanded(child: Text(address.primary == 'true' ?'Yes':'No')),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('Delete',style: TextStyle(color: Colors.red),),
                  onPressed: ()async {
                    await AddressGetXController.to.deleteAttachment(id: address.id, context: context);
                  },
                ),
                const Spacer(),
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateAddressScreen(address),));
                  },
                )
              ],
            )
          ],
        ));
  }
}
