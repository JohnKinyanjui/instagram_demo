import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstProfileText extends StatelessWidget {
  final String num;
  final String text;

  InstProfileText({this.num, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(num,style: GoogleFonts.averageSans(
          textStyle: TextStyle(fontWeight: FontWeight.bold),
          fontSize: 16
        ),),
        Text(text,style: TextStyle(fontFamily: 'Sans',fontSize: 15,color: Colors.black),)
      ],
    );
  }
}
