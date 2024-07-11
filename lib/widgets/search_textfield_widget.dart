// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/bloc/food_recipes_bloc.dart';

import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/resources/recipes_repository.dart';
import 'package:recipeapp/screens/recipe%20category/widgets/all_recipe_screen.dart';

class SearchTextFieldWidgets extends StatelessWidget {
  final String searchHintText;
  final IconData searchIcon;
  const SearchTextFieldWidgets({
    super.key,
    required this.searchHintText,
    required this.searchIcon,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController search = TextEditingController();
    return Container(
      height: height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 2)
      ], borderRadius: BorderRadius.circular(MyDimension.radius15)),
      child: TextField(
        onSubmitted:(value) {
          Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => FoodRecipesBloc(
                            recipesRepository: RecipesRepository())
                          ..add(FoodRecipesLoadedEvent(foodCat: value)),
                        child: AllRecipeScreen(name: value),
                      ),
                    ));
        },
        textInputAction: TextInputAction.search,
        controller: search,
        style: TextStyle(fontSize: width * 0.04, color: Colors.black),
        decoration: InputDecoration(
            suffixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.teal
                    : Colors.grey),
            suffixIcon: Icon(
              searchIcon,
              size: width * 0.07,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(MyDimension.radius15),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: MyDimension.width20),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(MyDimension.radius15),
                borderSide: const BorderSide(color: Colors.teal, width: 2)),
            hintText: searchHintText,
            hintStyle: TextStyle(fontSize: width * 0.036, color: Colors.grey)),
      ),
    );
  }
}
