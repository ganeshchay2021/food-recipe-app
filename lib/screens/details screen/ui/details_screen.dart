import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/model/recipes_model.dart';
import 'package:recipeapp/screens/details%20screen/widgets/alert_dialog_box.dart';
import 'package:recipeapp/screens/details%20screen/widgets/circle_buttons.dart';
import 'package:recipeapp/screens/details%20screen/widgets/custom_clip_Path.dart';
import 'package:recipeapp/screens/details%20screen/widgets/ingradents_list.dart';
import 'package:recipeapp/widgets/share_recipe.dart';
import 'package:recipeapp/widgets/start_cooking.dart';

class DetailScreen extends StatelessWidget {
  final RecipeModel recipeModel;

  const DetailScreen({
    super.key,
    required this.recipeModel,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var myBox = Hive.box("saved");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: MyDimension.width14),
                child: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: BackButton(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: recipeModel.recipe.image,
                  child: CachedNetworkImage(
                    imageUrl: recipeModel.recipe.image,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade300,
                    ),
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: height * 0.44,
                        width: width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: imageProvider),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MyDimension.width15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MyDimension.height20),
                  Text(
                    recipeModel.recipe.label,
                    style: TextStyle(
                      fontSize: MyDimension.textSize20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${recipeModel.recipe.totalTime.toInt()} mins",
                    style: TextStyle(fontSize: MyDimension.textSize15),
                  ),
                  SizedBox(height: MyDimension.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ShareRecipe.share(recipeModel.recipe.url);
                        },
                        child: const CircleButtons(
                          label: "Share",
                          icon: Icons.share,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: myBox.listenable(),
                        builder: (context, value, child) {
                          String key = recipeModel.recipe.label;
                          bool saved = myBox.containsKey(key);
                          if (saved) {
                            return GestureDetector(
                              onTap: () {
                                myBox.delete(key);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(seconds: 1),
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            "Recipe Deleted Successfully")));
                              },
                              child: const CircleButtons(
                                label: "Saved",
                                icon: Icons.bookmark,
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                myBox.put(key, key);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(seconds: 1),
                                        backgroundColor: Colors.green,
                                        content:
                                            Text("Recipe Saved Successfully")));
                              },
                              child: const CircleButtons(
                                label: "Save",
                                icon: Icons.bookmark_border,
                              ),
                            );
                          }
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          ShowDialog.showCalories(context);
                        },
                        child: const CircleButtons(
                          label: "Calories",
                          icon: Icons.monitor_heart_outlined,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleButtons(
                          label: "Unit chart",
                          icon: Icons.table_chart_outlined,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Direction",
                        style: TextStyle(
                          fontSize: MyDimension.textSize20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade300,
                        ),
                        onPressed: () {
                          StartCooking.cooking(recipeModel.recipe.url);
                        },
                        child: Text(
                          "Start",
                          style: TextStyle(
                            fontSize: MyDimension.textSize15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    height: MyDimension.height50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ClipPath(
                            clipper: CustomClipPath(),
                            child: Container(
                              alignment: Alignment.center,
                              decoration:
                                  const BoxDecoration(color: Colors.teal),
                              child: Text(
                                "Ingredients Required",
                                style: TextStyle(
                                  fontSize: MyDimension.textSize20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Text(
                              "${recipeModel.recipe.ingredients.length}\nItems",
                              style: TextStyle(
                                height: 1,
                                fontSize: MyDimension.textSize15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: IngradientsList(
                      recipeModel: recipeModel,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
