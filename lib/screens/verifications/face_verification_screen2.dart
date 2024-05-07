import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterimageapp/services/camera_services.dart';
import 'package:flutterimageapp/widgets/appbar.dart';

import '../../widgets/number_with_progressbar.dart';

class FaceVerificationScreen2 extends StatefulWidget {
  FaceVerificationScreen2({super.key, required this.controller});
  CameraController? controller;

  @override
  State<FaceVerificationScreen2> createState() =>
      _FaceVerificationScreen2State();
}

class _FaceVerificationScreen2State extends State<FaceVerificationScreen2> {
  bool full = false;

  void takePicture() async {
    setState(() {
      full = !full;
    });
    await CameraServices.takePicture(widget.controller!, context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    takePicture();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                child: widget.controller!.value.isInitialized
                    ? CameraPreview(widget.controller!)
                    : Image.asset(
                        "assets/images/person.png",
                        fit: BoxFit.cover,
                      )),
            Positioned(
                top: screenHeight / 40,
                left: screenWidth / 6,
                child: const Text(
                  "Please look into the camera and hold still",
                  textAlign: TextAlign.center,
                )),
            Positioned(
                top: screenHeight * 0.11,
                left: screenWidth * 0.05,
                child: Image.asset(
                  "assets/images/placeimage.png",
                )),
            Positioned(
              child: NumberWithProgressBar(
                controller: widget.controller!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
