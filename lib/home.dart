import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/api/constants.dart';
import 'package:instagram/screens/screen_activity.dart';
import 'package:instagram/screens/screen_home.dart';
import 'package:instagram/screens/screen_profile.dart';
import 'package:instagram/screens/screen_search.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:instagram/screens/screen_add.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  items selelected_item = items.home;

  static List<Widget> screens = [
    ScreenHome(),
    ScreenSearch(),
    ScreenAdd(),
    ScreenActivity(),
    ScreenProfile()
  ];
  Widget screen = screens[0];
  final bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: PageStorage(bucket: bucket,child: screen,),
      bottomNavigationBar: Container(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.fromBorderSide(BorderSide(color: Colors.grey[300]))
          ),
          child: Row(
            children: <Widget>[
              Expanded(child: IconButton(icon: Icon(selelected_item == items.home ? Foundation.home : LineAwesomeIcons.home, color: Colors.black,size: 25,), onPressed: (){
              setState(() {
                  selelected_item = items.home;
                  screen = screens[0];
                  });
              })),
              Expanded(child: IconButton(icon: Icon(selelected_item == items.search ? FontAwesome.search : Ionicons.ios_search, color: Colors.black,), onPressed: (){
              setState(() {
                selelected_item= items.search;
                screen = screens[1];
              });
              })),
              Expanded(child: IconButton(icon: Icon(LineAwesomeIcons.plus_square, color: Colors.black,), onPressed: (){
              setState(() {
                selelected_item = items.add;
              });
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenAdd()));
              })),
              Expanded(child: IconButton(icon: Icon(selelected_item == items.activities ? LineAwesomeIcons.heart : LineAwesomeIcons.heart_o, color: Colors.black,), onPressed: (){
              setState(() {
                selelected_item = items.activities;
                screen = screens[3];
              });
              })),
              Expanded(child: IconButton(icon: Icon(selelected_item == items.profile ? FontAwesome.user :FontAwesome.user_o, color: Colors.black,), onPressed: (){
                setState(() {
                  selelected_item = items.profile;
                  screen = screens[4];
                });
              })),
            ],
          ),
        ),
      ),
    );
  }
}

enum items{
  home,
  search,
  add,
  activities,
  profile
}