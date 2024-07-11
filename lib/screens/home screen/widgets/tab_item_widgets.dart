// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipeapp/dimension/my_dimension.dart';

class TabItem extends StatelessWidget {
  final String tabTitle;
  const TabItem({
    super.key,
    required this.tabTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyDimension.radius20),
          border: Border.all(color: Colors.teal)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MyDimension.width10),
        child: Center(
          child: Text(
            tabTitle,
            style: TextStyle(
                fontSize: MyDimension.textSize12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
