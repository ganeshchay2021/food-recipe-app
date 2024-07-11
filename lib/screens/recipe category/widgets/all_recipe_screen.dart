// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipeapp/bloc/food_recipes_bloc.dart';
import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/screens/details%20screen/ui/details_screen.dart';
import 'package:recipeapp/widgets/custom_appbar.dart';

class AllRecipeScreen extends StatelessWidget {
  final String name;
  const AllRecipeScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(recipeType: name, back: true),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MyDimension.width10, vertical: MyDimension.height5),
          child: BlocBuilder<FoodRecipesBloc, FoodRecipesState>(
            builder: (context, state) {
              if (state is FoodRecipesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FoodRecipesLoadedState) {
                if (state.recipeModel.isEmpty) {
                  return Center(
                    child: Text(
                      "No results found",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: MyDimension.textSize15),
                    ),
                  );
                }
                return SizedBox(
                  child: GridView.builder(
                    itemCount: state.recipeModel.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: MyDimension.height20,
                        crossAxisSpacing: MyDimension.width15,
                        childAspectRatio: 0.7 / 1),
                    itemBuilder: (context, index) {
                      final recipe = state.recipeModel[index].recipe;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    recipeModel: state.recipeModel[index]),
                              ));
                        },
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag:
                                          state.recipeModel[index].recipe.image,
                                      child: CachedNetworkImage(
                                        imageUrl: recipe.image,
                                        placeholder: (context, url) =>
                                            Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MyDimension.radius20)),
                                        ),
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MyDimension.radius20),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: imageProvider,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      top: MyDimension.height10,
                                      left: MyDimension.left15,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: MyDimension.height20,
                                        width: MyDimension.width50,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                                MyDimension.radius10)),
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          "${recipe.totalTime} mins",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MyDimension.textSize10),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MyDimension.height5,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  recipe.label,
                                  style: TextStyle(
                                      fontSize: MyDimension.height15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is FoodRecipesErrorState) {
                return Center(
                  child: Text(state.errorMsg),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ));
  }
}
