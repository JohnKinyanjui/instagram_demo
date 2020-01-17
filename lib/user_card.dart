import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imagepath;
  final String username;

  UserCard({@required this.imagepath,@required this.username});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color :Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey,width: 1)
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(imagepath),fit: BoxFit.fill),
                  shape: BoxShape.circle
                ),
              ),
            ),
            Text(username,style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.w700),),
            Padding(
              padding: const EdgeInsets.only(top :8.0,bottom: 24.0),
              child: Text("Suggested users for you",style: TextStyle(fontSize: 10),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Center(child: Text("Follow",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontFamily: 'Sans'),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
