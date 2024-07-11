import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/bloc/food_recipes_bloc.dart';
import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/resources/recipes_repository.dart';
import 'package:recipeapp/screens/recipe%20category/widgets/all_recipe_screen.dart';

class RecipeCategoryView extends StatefulWidget {
  final String name;
  final String image;

  const RecipeCategoryView({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  State<RecipeCategoryView> createState() => _RecipeCategoryViewState();
}

class _RecipeCategoryViewState extends State<RecipeCategoryView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) =>
                    FoodRecipesBloc(recipesRepository: RecipesRepository())
                      ..add(FoodRecipesLoadedEvent(foodCat: widget.name)),
                child: AllRecipeScreen(name: widget.name),
              ),
            ));
      },
      child: SizedBox(
        height: height * .105,
        width: width * .2,
        child: Column(
          children: [
            Container(
              height: height * .07,
              width: width * .15,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(MyDimension.radius10),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(widget.image))),
            ),
            SizedBox(
              height: height * 0.003,
            ),
            Text(
              widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            )
          ],
        ),
      ),
    );
  }
}
