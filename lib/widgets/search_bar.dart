import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget searchBar(double screenWidth, double screenHeight) {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(screenHeight / 50)),
    width: screenWidth,
    child: TextFormField(
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(screenWidth / 40),
          suffixIcon: Image.asset("assets/icons/cancel.png")),
    ),
  );
}
