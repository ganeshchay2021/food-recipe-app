// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:recipeapp/dimension/my_dimension.dart';

class BannerWidget extends StatelessWidget {
  final String bannerImage;
  final String bannerText;
  const BannerWidget({
    super.key,
    required this.bannerImage,
    required this.bannerText,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: height * .25,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MyDimension.radius20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(bannerImage),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MyDimension.width20,
                vertical: MyDimension.height20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      bannerText,
                      style: TextStyle(
                        color: Colors.white,
                        wordSpacing: 5,
                        height: 1.1,
                        fontWeight: FontWeight.w500,
                        fontSize: MyDimension.textSize25,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MyDimension.height15,
                ),
                SizedBox(
                  height: MyDimension.height35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {},
                    child: Text(
                      "Explore",
                      style: TextStyle(
                          fontSize: MyDimension.textSize20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
