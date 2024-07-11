import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          "What are you\ncooking today",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width * .07,
            height: 1,
          ),
        ),
      ],
    );
  }
}
