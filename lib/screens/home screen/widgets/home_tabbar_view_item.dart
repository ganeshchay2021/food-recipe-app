// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/dimension/my_dimension.dart';

import 'package:recipeapp/model/recipes_model.dart';

class HomeTabBarViewItem extends StatelessWidget {
  final RecipeModel recipeModel;
  const HomeTabBarViewItem({
    super.key,
    required this.recipeModel,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: recipeModel.recipe.image,
          child: CachedNetworkImage(
            imageUrl: recipeModel.recipe.image,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: height * 0.22,
              width: width * 0.5,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(MyDimension.radius15)),
            ),
            imageBuilder: (context, imageProvider) {
              return Container(
                height: height * 0.22,
                width: width * .5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: imageProvider),
                    borderRadius: BorderRadius.circular(MyDimension.radius15)),
              );
            },
          ),
        ),
        SizedBox(
          height: MyDimension.height5,
        ),
        SizedBox(
          height: height * 0.10,
          width: width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipeModel.recipe.label,
                maxLines: 2,
                style: TextStyle(
                    height: 1.2,
                    overflow: TextOverflow.ellipsis,
                    fontSize: MyDimension.textSize15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MyDimension.height10,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: MyDimension.textSize15,
                      height: 1,
                      color: Colors.black45),
                  children: [
                    TextSpan(
                        text:
                            "Calories ${recipeModel.recipe.calories.round()}"),
                    WidgetSpan(
                      child: SizedBox(
                        width: MyDimension.width15,
                      ),
                    ),
                    WidgetSpan(
                        child: Icon(
                      Icons.timer_outlined,
                      color: Colors.black45,
                      size: MyDimension.iconSize15,
                    )),
                    TextSpan(
                        text: " ${recipeModel.recipe.totalTime.toInt()} Mins")
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
