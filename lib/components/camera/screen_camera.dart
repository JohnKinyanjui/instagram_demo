import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/components/camera/image_preview.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
}
class ScreenCamera extends StatefulWidget {
  ScreenCamera({Key key, }) : super(key: key);
  @override
  _ScreenCameraState createState() => _ScreenCameraState();
}

class _ScreenCameraState extends State<ScreenCamera> {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;
  @override
  void initState() {
    super.initState();
    // 1
    availableCameras().then((availableCameras) {

      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          // 2
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      }else{
        print("No camera available");
      }
    }).catchError((err) {
      // 3
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    // 3
    controller = CameraController(cameraDescription, ResolutionPreset.ultraHigh);

    // If the controller is updated then update the UI.
    // 4
    controller.addListener(() {
      // 5
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    // 6
    try {
      await controller.initialize();
    } on CameraException catch (e) {
    }

    if (mounted) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Text('Camera',),
        leading: Icon(LineAwesomeIcons.close),
      ),
      body: Column(
        children: <Widget>[

          Stack(
            children: <Widget>[
              Container(
                height: 350,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                           Container(
                            height: 350,
                            width: double.infinity,
                            color: Colors.grey[50],
                            child: _cameraPreviewWidget(),
                          ),
                      ],
                    ),

                  ],
                ),
              ),
              Positioned(
                height: 620,
                left: 10,
                child: IconButton(icon : Icon(FontAwesome.rotate_right,color: Colors.white,size: 30,),onPressed: (){
                  _onSwitchCamera();
                },),)
            ],
          ),
              Padding(
                padding: const EdgeInsets.only(top :50.0),
                child: InkWell(
                  splashColor: Colors.grey[100],
                  onTap: (){
                    _onCapturePressed(context);
                  },
                  child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),

        ],
      ),
    );
  }
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
  void _onCapturePressed(context) async {
    try {
      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      print(path);
      await controller.takePicture(path);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreview(imagePath: path),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx =
    selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    _initCameraController(selectedCamera);
  }


}

