import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/assets/image_path.dart';
import 'package:recipeapp/bloc/food_recipes_bloc.dart';
import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/resources/recipes_repository.dart';
import 'package:recipeapp/screens/home%20screen/widgets/banner_widgets.dart';
import 'package:recipeapp/screens/home%20screen/widgets/home_screen_appbar.dart';
import 'package:recipeapp/widgets/search_textfield_widget.dart';
import 'package:recipeapp/screens/home%20screen/widgets/tab_bar_widgets.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 121, 121).withOpacity(.3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MyDimension.height10,
                horizontal: MyDimension.width10),
            child: Column(
              children: [
                //this is the Header part of Home Screen
                const HomeAppBar(),

                SizedBox(height: height * 0.022),

                //This is Search Textfield part
                const SearchTextFieldWidgets(
                    searchHintText: "what's cooking on your mind...?",
                    searchIcon: Icons.search),

                SizedBox(height: height * 0.022),

                //This is the Banner Part of Home Screen
                BannerWidget(
                  bannerImage: ImagePath.explore,
                  bannerText: "Cook the best\nrecipes at home",
                ),

                SizedBox(
                  height: height * 0.023,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                          fontSize: width * 0.045, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontSize: MyDimension.width15,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),

                SizedBox(height: height * 0.022),

                //This is the Tabbar Part
                BlocProvider(
                  create: (context) =>
                      FoodRecipesBloc(recipesRepository: RecipesRepository()),
                  child: const TarBarWidgets(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
