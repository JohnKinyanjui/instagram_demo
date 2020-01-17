import 'package:flutter/material.dart';

class InstSearchButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPress;
  final bool visible;
  InstSearchButton({@required this.text,@required this.icon,@required this.onPress,@required this.visible});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey[100],width: 1.5)
          ),
          height: 30,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: visible,
                      child: Padding(
                        padding: const EdgeInsets.only(right :8.0),
                        child: Icon(icon,color: Colors.black,size: 15,),
                      )),
                  Text(text,style: TextStyle(fontSize: 14,fontFamily: 'Sans'),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
