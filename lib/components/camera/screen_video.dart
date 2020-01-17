import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ScreenVideo extends StatefulWidget {
  ScreenVideo({Key key}) : super(key: key);

  @override
  _ScreenVideoState createState() => _ScreenVideoState();
}

class _ScreenVideoState extends State<ScreenVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Text('Video',),
        leading: Icon(LineAwesomeIcons.close),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey[50],
          ),
          Padding(
            padding: const EdgeInsets.only(top :50.0),
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

        ],
      ),
    );
  }
}