import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {   @override

final int? id;
final String name;
final String shortDescription;
final String longDescription;
final String img;
final int? categoryId;

const ServiceCard({
  super.key,
  this.id,
  required this.name,
  required this.shortDescription,
  required this.longDescription,
  required this.img,
  this.categoryId});


@override
Widget build(BuildContext context) {
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100.0,
                  child: Image.network(img,fit: BoxFit.cover,),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(name),
                  trailing: Icon(Icons.favorite_outline),
                ),
              ),
            ],
          ),
          Text(shortDescription),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('GET APPOINTMENT'),
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
      ));
}
}