import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipeapp/dimension/my_dimension.dart';

class ShowDialog {
  static Future showCalories(BuildContext context) {
    Random random = Random();
    int fat = random.nextInt(20) + 1;
    int sFat = random.nextInt(40) + 20;
    int cholesterol = random.nextInt(60) + 40;
    int nA = random.nextInt(80) + 60;
    int carbohydrate = random.nextInt(100) + 80;
    int sugar = random.nextInt(100) + 10;
    int protein = random.nextInt(50) + 0;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MyDimension.radius10),
          ),
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: MyDimension.bottom15),
              child: const Text(
                "Nutritional Fact",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          content: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MyDimension.width15, vertical: MyDimension.height5),
            height: MyDimension.height300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(MyDimension.radius10),
                bottomRight: Radius.circular(MyDimension.radius10),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MyDimension.height5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Fat",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "$fat",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MyDimension.height5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saturated Fat",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "$sFat",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MyDimension.height5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cholesterol",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "$cholesterol",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MyDimension.height5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sodium",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "$nA",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MyDimension.height5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Carbohydrate",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "$carbohydrate",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MyDimension.height5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sugar",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "$sugar",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MyDimension.height5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Protein",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "$protein",
                        style: TextStyle(
                            fontSize: MyDimension.textSize20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
