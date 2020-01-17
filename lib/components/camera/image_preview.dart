import 'package:flutter/material.dart';
import 'package:storage_path/storage_path.dart';
class ImagePreview extends StatelessWidget {
  final String imagePath;

  ImagePreview({this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
