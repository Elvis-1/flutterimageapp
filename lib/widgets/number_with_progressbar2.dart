import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterimageapp/constants/app_colors.dart';

class NumberWithProgressBar2 extends StatefulWidget {
  @override
  _NumberWithProgressBar2State createState() => _NumberWithProgressBar2State();
}

class _NumberWithProgressBar2State extends State<NumberWithProgressBar2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '${(_animation.value * 100).toInt()}% Scanning',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHeight / 50),
        Container(
          margin: EdgeInsets.only(bottom: screenHeight / 50),
          width: screenWidth / 1.4,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(15),
            value: _animation.value,
            minHeight: 10,
            backgroundColor:
                Colors.grey[300], // Background color of the progress bar
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
