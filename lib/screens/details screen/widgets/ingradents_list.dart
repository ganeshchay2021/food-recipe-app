// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/model/recipes_model.dart';

class IngradientsList extends StatelessWidget {
  final RecipeModel recipeModel;
  const IngradientsList({
    super.key,
    required this.recipeModel,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    var myBox = Hive.box("shopping");

    return ListView.builder(
      padding: EdgeInsets.only(top: height*0.020),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipeModel.recipe.ingredients.length,
      itemBuilder: (context, index) {
        final ingradents = recipeModel.recipe.ingredients[index];
        return Container(
          margin: EdgeInsets.symmetric(
              vertical: height * .01, horizontal: width * .033),
          padding: EdgeInsets.only(
              top: height * .008,
              bottom: height * 0.008,
              right: width * 0.08,
              left: height * 0.008),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(MyDimension.radius10)),
          height: MyDimension.height100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(MyDimension.radius10),
                child: CachedNetworkImage(
                  imageUrl: ingradents.image!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    height: height * 0.1,
                    width: width * 0.2,
                  ),
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: height * 0.1,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider)),
                    );
                  },
                ),
              ),
              SizedBox(
                width: width * 0.033,
              ),
              Expanded(
                flex: 6,
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  "${ingradents.food}\n${ingradents.weight.toInt()} gm  ${ingradents.measure} ",
                  style: TextStyle(
                      fontSize: width * 0.04, letterSpacing: 1, height: 1.2),
                ),
              ),
              // const Spacer(),
              ValueListenableBuilder(
                valueListenable: myBox.listenable(),
                builder: (context, value, child) {
                  String key = recipeModel.recipe.ingredients[index].text;
                  bool saved = myBox.containsKey(key);
                  if (saved) {
                    return GestureDetector(
                      onTap: () {
                        myBox.delete(key);
                      },
                      child: Icon(
                        Icons.check,
                        size: width * 0.07,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        myBox.put(key, key);
                      },
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        size: width * 0.07,
                        color: Colors.red,
                      ),
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
