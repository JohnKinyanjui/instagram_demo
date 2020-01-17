import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:storage_path/storage_path.dart';

import '../../models/image.dart';

class ScreenImage extends StatefulWidget {
  @override
  _ScreenImageState createState() => _ScreenImageState();
}

class _ScreenImageState extends State<ScreenImage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      leading: Icon(LineAwesomeIcons.close),
    ),
     body: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           FutureBuilder(
            future: StoragePath.imagesPath,
            builder: (context,snapshot){
              if(snapshot.hasData){
                List<dynamic> list = json.decode(snapshot.data);
                ImageModel imageModel = ImageModel.fromJson(list[0]);

                return Column(
                  children: <Widget>[
                    Container(
                        height :300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[50],width: 2),
                            image: DecorationImage(image: FileImage(File(imageModel.files[1])),)
                        )),
                    GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (context,index){
                          ImageModel imageModel = ImageModel.fromJson(list[index]);
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[50],width: 2),
                                image: DecorationImage(image: FileImage(File(imageModel.files[0])),fit: BoxFit.fill)
                              )),
                          );
                        }),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
           })
         ],
       ),
     ),
    );
  }
}
