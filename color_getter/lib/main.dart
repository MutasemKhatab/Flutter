import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(cameras: cameras),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const MyHomePage({required this.cameras});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CameraController _controller;
  Color selectedColor = Colors.transparent;
  String degree = '';
  bool isTaken = false;
  Image image = Image.file(File(''));
  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    if (widget.cameras.isEmpty) {
      print('No cameras available');
    } else {
      _controller = CameraController(
        widget.cameras[0],
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );

      await _controller.initialize();

      _controller.startImageStream((CameraImage image) {
        _processCameraImage(image);
      });
    }
  }

  void _processCameraImage(CameraImage image) {
    if (mounted) {
      int centerX = image.width ~/ 2;
      int centerY = image.height ~/ 2;

      // Extract the color of the center pixel
      int pixelColor = image.planes[0].bytes[centerY * image.width + centerX];

      setState(() {
        if (isTaken) return;
        selectedColor = Color(pixelColor);
        double deg = 8 - 8 * pixelColor / 255;
        deg -= 0.499;
        if (deg > 7.5) {
          degree = '8.0';
          selectedColor = const Color.fromARGB(255, 9, 7, 11);
        } else if (deg > 7.0) {
          degree = '7.5';
          selectedColor = const Color.fromARGB(255, 25, 9, 11);
        } else if (deg > 6.5) {
          degree = '7.0';
          selectedColor = const Color.fromARGB(255, 32, 7, 11);
        } else if (deg > 6.0) {
          degree = '6.5';
          selectedColor = const Color.fromARGB(255, 44, 9, 12);
        } else if (deg > 5.5) {
          degree = '6.0';
          selectedColor = const Color.fromARGB(255, 64, 7, 11);
        } else if (deg > 5.0) {
          degree = '5.5';
          selectedColor = const Color.fromARGB(255, 87, 10, 10);
        } else if (deg > 4.5) {
          degree = '5.0';
          selectedColor = const Color.fromARGB(255, 108, 7, 7);
        } else if (deg > 4.0) {
          degree = '4.5';
          selectedColor = const Color.fromARGB(255, 154, 0, 0);
        } else if (deg > 3.5) {
          degree = '4.0';
          selectedColor = const Color.fromARGB(255, 162, 30, 12);
        } else if (deg > 3.0) {
          degree = '3.5';
          selectedColor = const Color.fromARGB(255, 192, 42, 15);
        } else if (deg > 2.5) {
          degree = '3.0';
          selectedColor = const Color.fromARGB(255, 224, 79, 24);
        } else if (deg > 2.0) {
          degree = '2.5';
          selectedColor = const Color.fromARGB(255, 237, 110, 31);
        } else if (deg > 1.5) {
          degree = '2.0';
          selectedColor = const Color.fromARGB(255, 254, 158, 40);
        } else if (deg > 1.0) {
          degree = '1.5';
          selectedColor = const Color.fromARGB(255, 255, 193, 53);
        } else if (deg > 0.5) {
          degree = '1.0';
          selectedColor = const Color.fromARGB(255, 255, 230, 94);
        } else {
          degree = '0.5';
          selectedColor = const Color.fromARGB(255, 254, 255, 187);
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Color Picker'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: isTaken ? image : CameraPreview(_controller),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: isTaken
                    ? () {
                        setState(() {
                          isTaken = false;
                        });
                      }
                    : () async {
                        final _image = await _controller.takePicture();
                        image = Image.file(File(_image.path));
                        isTaken = true;
                      },
                child: Text(isTaken ? "go back" : 'take a pic')),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                width: 150,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: selectedColor,
                      ),
                      Text(
                        degree,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ]),
              )),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                color: selectedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
