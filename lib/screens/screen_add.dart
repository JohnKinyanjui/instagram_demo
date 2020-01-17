import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram/components/camera/screen_camera.dart';
import 'package:instagram/components/camera/screen_image.dart';
import 'package:instagram/components/camera/screen_video.dart';


class ScreenAdd extends StatefulWidget {
  ScreenAdd({Key key}) : super(key: key);

  @override
  _ScreenAddState createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {
  static final firstCamera = cameras.first;

  List<Widget> screens = [
      ScreenImage(),
      ScreenCamera(),
      ScreenVideo()
    ];
     List<Widget> tab = [
       Text("GALLERY",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Sans',color: Colors.black),),
       Text("CAMERA",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Sans',color: Colors.black)),
       Text("VIDEO",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Sans',color: Colors.black)),
     ];

  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(children: screens),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.grey[100],
          child: TabBar(
            tabs: tab,
            unselectedLabelColor: Colors.grey[50],
            indicatorWeight: 1,
            indicatorColor: Colors.black,
          ),
        ),
      ),
    );
  }}

