import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipeapp/dimension/my_dimension.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.015, vertical: height * .01),
        child: GNav(
          gap: MyDimension.width10,
          tabBorderRadius: MyDimension.radius100,
          backgroundColor: Colors.grey[100]!,
          activeColor: Colors.white,
          color: Colors.teal,
          tabBackgroundGradient: LinearGradient(
              colors: [Colors.teal[400]!, Colors.teal.shade700],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
          iconSize: MyDimension.iconSize30,
          textSize: MyDimension.width15,
          padding: EdgeInsets.symmetric(
              horizontal: width * .01, vertical: height * .007),
          tabs: const [
            GButton(icon: CupertinoIcons.home, text: 'Home'),
            GButton(icon: Icons.category, text: 'Categories'),
            GButton(icon: CupertinoIcons.search, text: 'Search'),
            GButton(icon: CupertinoIcons.bookmark_solid, text: 'Saved'),
            GButton(icon: CupertinoIcons.shopping_cart, text: 'Shopping'),
            
          ],
          onTabChange: widget.onTap,
          selectedIndex: widget.selectedIndex,
        ),
      ),
    );
  }
}
