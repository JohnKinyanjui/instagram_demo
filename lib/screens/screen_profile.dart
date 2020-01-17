import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/api/key.dart';
import 'package:instagram/components/profile_widgets/inst_profile_button.dart';
import 'package:instagram/components/profile_widgets/inst_profile_text.dart';
import 'package:instagram/components/connection/no_connection.dart';
import '../api/constants.dart';
import 'package:http/http.dart' as http;

class ScreenProfile extends StatefulWidget {
  @override
  _ScreenProfileState createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  static num initial_page =0;
  PageController _myPage = PageController(initialPage: initial_page);
@override
  void initState() {
    super.initState();
    getUserInfo(http.Client());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: FutureBuilder(
              future: getUserInfo(http.Client()),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                  Map data = snapshot.data;
                  print(data['username']);
                  print(data['user_pic']);
                  print(data['full_name']);
                  print(data['description']);
                  print(data['images'][0]['image']);
                  print(data['videos'][0]['video']);
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
                              child: Text(data['username'],style: TextStyle(color: Colors.black, fontFamily: 'Sans',fontSize: 22),),
                            ),
                            Expanded(child: SizedBox()),
                            IconButton(icon: Icon(Ionicons.ios_menu,color: Colors.black,), onPressed: (){})
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
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
                                        image: DecorationImage(image: NetworkImage(data['user_pic']),fit: BoxFit.cover)
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
                            ],
                          ),

                          Expanded(child: InstProfileText(num: data['total_Posts'],text: "Posts",)),
                          Expanded(child: InstProfileText(num: data['followers'],text: "Followers",)),
                          Expanded(child: InstProfileText(num: data['following'],text: "Following",)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left :8.0,top: 2.0),
                        child: Text(data['full_name'], style: TextStyle(color: Colors.grey[500], fontFamily: 'Sans'),),
                      ),

                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context,int index){
                        return Padding(
                          padding: const EdgeInsets.only(left :8.0 ,top: 2),
                          child: Text(data['tags'][index]['item1'],style: TextStyle(color: Colors.blue[800],fontSize: 11),),
                        );
                      }),
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
                            Expanded(child: IconButton(icon: Icon(SimpleLineIcons.grid,size: 20,color: initial_page == 0 ? Colors.black : Colors.grey[300],), onPressed: (){}
                            )),
                            Expanded(child: IconButton(icon: Icon(SimpleLineIcons.user,size: 20,color: initial_page == 1 ? Colors.black :Colors.grey[300]), onPressed: (){}
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: PageView(
                            controller: _myPage,
                            onPageChanged: (number) {
                              setState(() {
                                initial_page = number;
                              });
                            },
                            children: <Widget>[
                              Center(
                                child: GridView.builder(
                                  itemCount:4,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                  itemBuilder: (context,int index){
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          border: Border.all(color: Colors.grey[400],width: 1),
                                            image: DecorationImage(image: NetworkImage(data['images'][index]['image']),fit: BoxFit.fill)
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Text('No one has Tagged you yet'),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  );
                }else if (snapshot.hasError) {
                   return NoConnection();
                }
                return Center(child: CircularProgressIndicator(),);
              },

            ),
          ),
    );
  }
}


class Small_Fab extends StatelessWidget {
  final Function onPress;
  Small_Fab({@required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
         height: 20,
         width: 20,
         decoration: BoxDecoration(
             color: Colors.blue,
             shape: BoxShape.circle
         ),
         child: Center(
           child: Icon(Icons.add, color: Colors.white,size: 20,),
         ),
      ),
    );
  }
}