// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipeapp/dimension/my_dimension.dart';

class CircleButtons extends StatelessWidget {
  final String label;
  final IconData icon;
  const CircleButtons({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.teal,
          radius: width * 0.06,
          child: Icon(
            icon,
            size: MyDimension.iconSize25,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: MyDimension.height5,
        ),
        Text(
          label,
          style: TextStyle(fontSize: MyDimension.textSize15),
        )
      ],
    );
  }
}
