import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/assets/image_path.dart';
import 'package:recipeapp/bloc/food_recipes_bloc.dart';
import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/resources/recipes_repository.dart';
import 'package:recipeapp/screens/recipe%20category/widgets/all_recipe_screen.dart';
import 'package:recipeapp/screens/recipe%20category/widgets/recipe_category_view.dart';

class RecipeCategoryBody extends StatelessWidget {
  const RecipeCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 121, 121).withOpacity(.3),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Text(
              "For Day",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: width * .06),
            ),
            SizedBox(
              height: height * 0.01,
            ),

            //This is for For Day Category
            SizedBox(
              height: height * .106,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(
                    name: name[0],
                    image: image[0],
                  ),
                  RecipeCategoryView(
                    name: name[1],
                    image: image[1],
                  ),
                  RecipeCategoryView(
                    name: name[2],
                    image: image[2],
                  ),
                  RecipeCategoryView(
                    name: name[3],
                    image: image[3],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height * 0.01,
            ),

            //This is for For you Category
            Text(
              "For you",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: width * .06),
            ),

            SizedBox(
                height: height * .45,
                child: GridView.builder(
                  itemCount: categoriesImage.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: width * 0.012,
                      crossAxisSpacing: height * .01,
                      mainAxisExtent: MyDimension.height100,
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => FoodRecipesBloc(
                                    recipesRepository: RecipesRepository())
                                  ..add(FoodRecipesLoadedEvent(
                                      foodCat: categories[index])),
                                child: AllRecipeScreen(
                                  name: categories[index],
                                ),
                              ),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(MyDimension.radius10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height * 0.005,
                              ),
                              SizedBox(
                                  height: height * 0.070,
                                  width: width * 0.12,
                                  child: Image.asset(
                                    categoriesImage[index],
                                    fit: BoxFit.fill,
                                  )),
                              SizedBox(
                                height: height * 0.0015,
                              ),
                              Text(
                                categories[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),

            //This is for Your Performance Category
            Text(
              "Your Performance",
              style: TextStyle(
                fontSize: width * 0.055,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.002,
            ),
            SizedBox(
              height: height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(
                    name: "Easy",
                    image: image[0],
                  ),
                  RecipeCategoryView(
                    name: "Quick",
                    image: image[1],
                  ),
                  RecipeCategoryView(
                    name: "Beef",
                    image: image[2],
                  ),
                  RecipeCategoryView(
                    name: "Low Fat",
                    image: image[3],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
