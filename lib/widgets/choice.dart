import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';

Widget choice(
  double screenHeight,
) {
  return Container(
    margin: EdgeInsets.only(right: screenHeight / 70),
    padding: EdgeInsets.symmetric(
        horizontal: screenHeight / 60, vertical: screenHeight / 70),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightText),
        borderRadius: BorderRadius.circular(
          screenHeight / 50,
        )),
    child: Text("Not Accepted"),
  );
}
