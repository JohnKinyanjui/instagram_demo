import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/api/key.dart';
import 'package:instagram/components/post/post_image.dart';
import 'package:instagram/screens/screen_profile.dart';
import 'package:instagram/status_circle.dart';
import 'package:instagram/user_card.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           elevation: 0.5,
           backgroundColor: Colors.grey[50],
           titleSpacing: 0,
           leading: IconButton(icon: Icon(SimpleLineIcons.camera,color: Colors.black,), onPressed: (){

           }),
           title: Padding(
             padding: const EdgeInsets.only(top :10.0),
             child: Text("Instagram",style: TextStyle(fontFamily: 'billabong',color: Colors.black,fontSize: 30),),
           ),
           actions: <Widget>[
             IconButton(icon: Icon(Icons.live_tv, color: Colors.black,), onPressed: (){}),
             IconButton(icon: Icon(LineAwesomeIcons.paper_plane, color: Colors.black,), onPressed: (){}),
           ],
         ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 115,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300],width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FutureBuilder(
                      future: getUserInfo(http.Client()),
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          Map data= snapshot.data;
                                return Stack(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                            height: 70,
                                            width: 68,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.grey, width: 1,),
                                              image: DecorationImage(image: NetworkImage(data['user_pic']),fit: BoxFit.fill)
                                            ),
                                          ),
                                        ),
                                        Text(data['username'],style: TextStyle(fontFamily: 'Sans'),)
                                      ],
                                    ),
                                    Positioned(
                                      top:50,
                                      left:50,
                                        child: Small_Fab(onPress: (){

                                        })
                                    )

                                  ],
                                );
                        }
                        return Container();
                      },
                    ),
                    FutureBuilder(
                      future: getStatus(),
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          Map data= snapshot.data;
                          return ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,int index){
                            return StatusCircle(status_link: data['status'][index]['images'][2]['link'], name: data['status'][index]['user_name']);
                          });
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
             FutureBuilder(
               future: getPost(),
                 builder: (context,snapshot){
                 if(snapshot.hasData){
                   Map data = snapshot.data;
                   return ListView.builder(
                     physics: const NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       itemCount: 4,
                       itemBuilder: (context,int index){
                         print(snapshot.data.length);
                         if(index==2){
                           return Container(
                             height: 240,
                             decoration: BoxDecoration(
                                 color: Colors.grey[50],
                                 border: Border.all(color: Colors.grey[500], width: 0.5)
                             ),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text("Suggested For You",style: TextStyle(fontSize: 15,fontFamily: 'Sans',fontWeight: FontWeight.w700,color: Colors.grey[700]),),
                                 ),
                                 FutureBuilder(
                                 future: getUsers(http.Client()),
                                 builder: (context,snapshot){
                                    if (snapshot.hasData) {
                                      Map data =snapshot.data;
                                       return Container(
                                         height: 200,
                                         child: ListView.builder(
                                           itemCount: data['users'].length,
                                                 scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context,int index){
                                                    return UserCard(imagepath: data['users'][index]['user_pic'], username: data['users'][index]['username']);
                                                  },
                                               ),
                                       );
                                    }
                                    return Container();
                                 }),
                               ],
                             ),
                           );
                         }
                         return PostImage(
                         username: data['posts'][index]['user']['user_name'],
                         user_pic: data['posts'][index]['user']['user_pic'],
                         likes: data['posts'][index]['post_likes'],
                         comments: data['posts'][index]['comments'][0]['comment_text'],
                       comments_no: data['posts'][index]['no_comments'],
                       post_data: data['posts'][index]['post_media'],);
                   });
                 }
                  return Center(child: CircularProgressIndicator(strokeWidth: 1,));
             })
          ],
        ),
      ),
    );
  }
}