import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterimageapp/widgets/appbar.dart';
import 'package:flutterimageapp/widgets/verification_btn.dart';

import 'face_verification_screen2.dart';

// enum CameraDevice {
//   rear,
//   front
// }
class FaceVerificationScreenq1 extends StatefulWidget {
  const FaceVerificationScreenq1({super.key});

  @override
  State<FaceVerificationScreenq1> createState() =>
      _FaceVerificationScreenq1State();
}

class _FaceVerificationScreenq1State extends State<FaceVerificationScreenq1> {
  late CameraController? controller;
  late List<CameraDescription> _cameras;

  XFile? imageFile;

  @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   final CameraController? cameraController = controller;

  //   // App state changed before we got the chance to initialize.
  //   if (cameraController == null || !cameraController.value.isInitialized) {
  //     return;
  //   }

  //   if (state == AppLifecycleState.inactive) {
  //     cameraController.dispose();
  //   } else if (state == AppLifecycleState.resumed) {
  //     _initializeCameraController(controller.description);
  //   }
  // }

  // @override
  // void initState() {
  //   //   cameraAvailability();
  //   super.initState();
  //   controller = CameraController(_cameras[0], ResolutionPreset.max);
  //   _initializeCameraController(controller.description);
  // }
  @override
  void initState() {
    super.initState();
    _getAvailableCamera();
  }

  void _getAvailableCamera() async {
    // Retrieve available cameras
    List<CameraDescription> cameras = await availableCameras();
    setState(() {
      _cameras = cameras;
    });
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context),
        body: Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight / 5,
              ),

              GestureDetector(
                  onTap: () async {
                    if (_cameras.isNotEmpty) {
                      // Find the front-facing camera
                      CameraDescription? frontCamera = _cameras.firstWhere(
                        (camera) =>
                            camera.lensDirection == CameraLensDirection.front,
                        orElse: () => _cameras.first,
                      );
                      // Initialize the camera controller with the first available camera
                      controller = CameraController(
                        frontCamera,
                        ResolutionPreset.medium,
                      );
                      await controller!.initialize();

                      setState(() {});
                      controller!.value.isInitialized
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FaceVerificationScreen2(
                                        controller: controller,
                                      )))
                          : null;
                    }
                  },
                  child: Image.asset('assets/images/placeholder.png')),

              SizedBox(
                height: screenHeight / 20,
              ),
              const Text(
                "Initiate face verification for quick attendance Process.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              // privacy notice
              const Text("Privacy Notice"),
              // divider
              const Divider(),
              GestureDetector(
                  onTap: () async {
                    if (_cameras.isNotEmpty) {
                      // Find the front-facing camera
                      CameraDescription? frontCamera = _cameras.firstWhere(
                        (camera) =>
                            camera.lensDirection == CameraLensDirection.front,
                        orElse: () => _cameras.first,
                      );
                      // Initialize the camera controller with the first available camera
                      controller = CameraController(
                        frontCamera,
                        ResolutionPreset.medium,
                      );
                      await controller!.initialize();

                      setState(() {});
                      controller!.value.isInitialized
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FaceVerificationScreen2(
                                        controller: controller,
                                      )))
                          : null;
                    }
                  },
                  child: verificationBtn(screenHeight, screenWidth, "Verify")),
            ],
          ),
        ));
  }
}
