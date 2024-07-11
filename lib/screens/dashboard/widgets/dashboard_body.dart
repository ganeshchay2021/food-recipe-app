import 'package:flutter/material.dart';
import 'package:recipeapp/screens/bottom%20navigation%20bar/bottom_nav_bar.dart';
import 'package:recipeapp/screens/home%20Screen/ui/home_screen.dart';

import 'package:recipeapp/screens/recipe%20category/ui/recipe_category.dart';
import 'package:recipeapp/screens/saved%20screen/ui/saved_screen.dart';
import 'package:recipeapp/screens/search%20recipe/widgets/search_screen_body.dart';
import 'package:recipeapp/screens/shopping%20ingradents/ui/shopping_ingradents.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          //This is Home Page Part
          HomeScreen(),
    
          //This is recipe category part
          RecipeCategoryBody(),
    
          //This is Search Recipe part
          SearchRecipeBody(),
    
          //This is saved Recipe Part
          SavedScreen(),
    
          //This is Shooping Part
          ShoppingIngradents()
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
