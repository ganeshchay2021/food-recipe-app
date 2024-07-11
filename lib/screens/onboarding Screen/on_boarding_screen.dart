import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipeapp/assets/image_path.dart';

import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/screens/dashboard/ui/dashboard.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            //On Boarding Image
            Positioned(
              top: 0,
              child: Container(
                height: height * .79,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImagePath.onBoardingImage),
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const Center(
                    child: Text(
                      "Yummy",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 224, 29, 120)),
                    ),
                  ),
                ),
              ),
            ),

            //Some Text and Get Started Button
            Positioned(
              bottom: 0,
              child: Container(
                height: height * 0.243,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(MyDimension.radius40),
                        topLeft: Radius.circular(MyDimension.radius40))),
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.032),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Let's cook good food",
                          style: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Check out the app and start start cooking delicious meals !",
                          style: TextStyle(
                              fontSize: MyDimension.width14,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: height * 0.032,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          height: MyDimension.height45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade500),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: const Dashboard(),
                                      type: PageTransitionType.fade));
                            },
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MyDimension.height15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
