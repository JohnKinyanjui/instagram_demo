import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/api/constants.dart';
import 'package:instagram/screens/screen_home.dart';

import '../../home.dart';

class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                stops: [0.0, 0.0, 0.0, 1.0, 0.8],
                colors: [color_1, color_2,color_3,color_4,color_5])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top :30.0),
              child: Center(child: Text("Instagram",style: TextStyle(color: Colors.white,fontFamily: 'billabong',fontSize: 40),)),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 50,
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.white,width: 0.8),
                   borderRadius: BorderRadius.all(Radius.circular(10))
                 ),
                 child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesome.user_o,color: Colors.white,size: 15,),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white,fontFamily: 'Sans'),
                      labelStyle: TextStyle(color: Colors.white,fontFamily: 'Sans'),
                      border: InputBorder.none,
                    ),
                 ),
               ),
             ),
            //

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 0.8),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesome.user_o,color: Colors.white,size: 15,),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white,fontFamily: 'Sans'),
                    labelStyle: TextStyle(color: Colors.white,fontFamily: 'Sans'),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
               splashColor: Colors.grey,
                onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(child: Text("Log In",style: TextStyle(color: color_4, fontSize: 15,fontWeight: FontWeight.bold),),),
                ),
              ),
            ),
            Center(child: Text("or",style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),),),

            /*
            * This are here for decorational purposes so they dont actuslly work
            * */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(FontAwesome5Brands.facebook, color: Colors.blue,),
                    ),
                    Expanded(child: Center(child: Text("Log In With Facebook",style: TextStyle(color: Colors.blueAccent, fontSize: 15,fontWeight: FontWeight.bold),)),),
                    SizedBox(width: 20,)
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(FontAwesome5Brands.google_plus, color: Colors.red,),
                    ),
                    Expanded(child: Center(child: Text("Log In With Facebook",style: TextStyle(color: Colors.red, fontSize: 15,fontWeight: FontWeight.bold),)),),
                    SizedBox(width: 20,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}