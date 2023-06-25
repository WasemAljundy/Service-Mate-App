import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/boarding_model.dart';
class OnBoardingWidget extends StatelessWidget {

  BoardingModel model;
  OnBoardingWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          const SizedBox(
            height: 70.0,
          ),
          Text(
            model.title,
            style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }
}