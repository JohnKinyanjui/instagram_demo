import 'package:flutter/material.dart';

class InstProfileButton extends StatelessWidget {
  final String text;
  final Function onPress;

  InstProfileButton({@required this.text,@required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.grey[100],width: 1)
          ),
          height: 30,
          child: Center(
            child: Text(text,style: TextStyle(fontSize: 14,fontFamily: 'Sans',fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
