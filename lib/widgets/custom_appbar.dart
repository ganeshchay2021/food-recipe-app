import 'package:flutter/material.dart';
import 'package:recipeapp/dimension/my_dimension.dart';

AppBar myAppBar({required String recipeType, required bool back}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.teal,
    centerTitle: true,
    title: Text(
      recipeType,
      style: TextStyle(color: Colors.white, fontSize: MyDimension.textSize25),
    ),
    leading: back
        ? const BackButton(
            color: Colors.white,
          )
        : null,
  );
}
