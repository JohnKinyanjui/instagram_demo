import 'package:flutter/material.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/screens/screen_profile.dart';
import '../profile_widgets/inst_profile_button.dart';
import '../profile_widgets/inst_profile_text.dart';
import '../../api/constants.dart';

class NoConnection extends StatefulWidget {
  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  PageController _myPage = PageController(initialPage: index);
  static int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('username',style: TextStyle(color: Colors.black, fontFamily: 'Sans',fontSize: 22),),
              ),
              Expanded(child: SizedBox()),
              IconButton(icon: Icon(Ionicons.ios_menu,color: Colors.black,), onPressed: (){})
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(BorderSide(color: grey,width: 1)),
                    ),
                  ),
                  Positioned(
                      top: 70,
                      left: 60,
                      child: Small_Fab(onPress: (){

                      }))
                ],
              ),
            ),
            Expanded(child: InstProfileText(num: '0',text: "Posts",)),
            Expanded(child: InstProfileText(num: '0',text: "Followers",)),
            Expanded(child: InstProfileText(num: '0',text: "Following",)),

          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left :8.0,top: 5.0),
          child: Text('full_name', style: TextStyle(color: Colors.grey[400], fontFamily: 'Sans'),),
        ),
        Padding(
          padding: const EdgeInsets.only(left :8.0,top: 5.0),
          child: Text('#No tags', style: TextStyle(color: Colors.blue[800], fontFamily: 'Sans'),),
        ),
        Row(
          children: <Widget>[
            Expanded(child: InstProfileButton(text: "Edit Profile", onPress: (){})),
            Expanded(child: InstProfileButton(text: "Promotions", onPress: (){})),
            Expanded(child: InstProfileButton(text: "Contacts", onPress: (){})),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[100],width: 1)
          ),
          child: Row(
            children: <Widget>[
              Expanded(child: IconButton(icon: Icon(SimpleLineIcons.grid,size: 20,color: index == 0 ? Colors.black : Colors.grey[300],), onPressed: (){}
              )),
              Expanded(child: IconButton(icon: Icon(SimpleLineIcons.user,size: 20,color: index == 1 ? Colors.black :Colors.grey[300]), onPressed: (){}
              )),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: PageView(
              controller: _myPage,
              onPageChanged: (int) {
                setState(() {
                  index = int;
                });
              },
              children: <Widget>[
                Center(
                  child: Text("No Data Connection")
                ),
                Center(
                  child: Container(
                    child: Text('Empty Body 1'),
                  ),
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}
