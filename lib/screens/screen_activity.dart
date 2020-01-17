import 'package:flutter/material.dart';

class ScreenActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.grey[100],
        title: Text("Activity",style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.bold),),
      ),
    );
  }
}
