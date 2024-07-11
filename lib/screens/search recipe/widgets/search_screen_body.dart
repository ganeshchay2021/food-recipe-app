import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/assets/image_path.dart';
import 'package:recipeapp/bloc/food_recipes_bloc.dart';
import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/resources/recipes_repository.dart';
import 'package:recipeapp/screens/recipe%20category/widgets/all_recipe_screen.dart';
import 'package:recipeapp/widgets/custom_appbar.dart';
import 'package:recipeapp/widgets/search_textfield_widget.dart';

class SearchRecipeBody extends StatelessWidget {
  const SearchRecipeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: myAppBar(recipeType: "Search", back: false),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: heigth * 0.016, horizontal: width * 0.032),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchTextFieldWidgets(
                searchHintText: "what's cooking on your mind...?",
                searchIcon: Icons.search),
            SizedBox(
              height: heigth * 0.04,
            ),
            Text(
              "Search Tags",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: width * 0.06),
            ),
            Wrap(
              spacing: MyDimension.width10,
              children: searchTags
                  .map((e) => ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => FoodRecipesBloc(
                                    recipesRepository: RecipesRepository())
                                  ..add(FoodRecipesLoadedEvent(foodCat: e)),
                                child: AllRecipeScreen(name: e),
                              ),
                            ));
                      },
                      child: Text(e)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
