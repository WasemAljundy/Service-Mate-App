import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/widgets/experiences_card.dart';

import '../../constent.dart';

class ShowExperiences extends StatelessWidget {
  const ShowExperiences({super.key});

  final String serviceName = "Service Name ";
  final String clint = "clint Name ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Showing Experiences for $clint"),
        backgroundColor: primaryColors,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ExperiencesCard(
              experience_name: "experience_name",
              from_time: "12/06/2023",
              to_time: "12/07/2023");
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
