import 'package:flutter/material.dart';
import 'package:flutterimageapp/constants/app_colors.dart';
import 'package:flutterimageapp/widgets/choice.dart';
import 'package:flutterimageapp/widgets/search_bar.dart';
import 'package:flutterimageapp/widgets/task_container.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Tasks of the day",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Image.asset("assets/icons/search.png"),
          SizedBox(
            width: screenWidth / 50,
          ),
          Image.asset("assets/icons/notify.png"),
          SizedBox(
            width: screenWidth / 50,
          ),
          Image.asset("assets/icons/user.png"),
          SizedBox(
            width: screenWidth / 20,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20, vertical: screenHeight / 50),
        child: Column(
          children: [
            // search bar
            searchBar(screenWidth, screenHeight),
            SizedBox(
              height: screenHeight / 50,
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // choice containers

                  Container(
                    width: double.infinity,
                    height: screenHeight / 20,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (ctx, index) {
                          return choice(screenHeight);
                        }),
                  ),
                  SizedBox(
                    height: screenHeight / 50,
                  ),
                  // task container
                  taskContainer(screenWidth, screenHeight,
                      btnColor: AppColors.primaryColor),
                  SizedBox(
                    height: screenHeight / 50,
                  ),
                  taskContainer(screenWidth, screenHeight,
                      btnColor: AppColors.redColor),
                  SizedBox(
                    height: screenHeight / 50,
                  ),
                  taskContainer(screenWidth, screenHeight, isBtn: false)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
