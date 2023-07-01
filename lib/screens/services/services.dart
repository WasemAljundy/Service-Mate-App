import 'dart:developer';

import 'package:flutter/material.dart';

import '../../constent.dart';
import '../../widgets/service_card.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);
  final String ServicImg =
      'https://www.shutterstock.com/image-illustration/our-services-writing-3d-render-260nw-1877372119.jpg';
  final String short = 'The generated Lorem Ipsum is therefore always free ';
  final String long =
      'The generated Lorem Ipsum is therefore always free The generated Lorem Ipsum is therefore always free';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ServiceScreen"),
        backgroundColor: primaryColors,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ServiceCard(
            img: ServicImg,
            name: "Servic name",
            shortDescription: short,
            longDescription: long,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          );
        },
        itemCount: 5,
      ),
    );
  }
}
