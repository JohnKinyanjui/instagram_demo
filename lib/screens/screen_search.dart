import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/api/key.dart';
import 'package:instagram/components/profile_widgets/inst_profile_button.dart';
import 'package:instagram/components/search_widgets/inst_search_button.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ScreenSearch extends StatefulWidget {
  ScreenSearch({Key key}) : super(key: key);

  @override
  _ScreenSearchState createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
         backgroundColor: Colors.grey[50],
        leading: IconButton(icon: Icon(Ionicons.ios_search,color: Colors.black,), onPressed: (){}),
        title: Text('Search',style: TextStyle(color: Colors.grey[400],fontFamily: 'Sans',fontSize: 18),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.live_tv), onPressed: (){

          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                 InstSearchButton(text: "IGTV", icon: Icons.live_tv, onPress: (){}, visible: true),
                  InstSearchButton(text: "Shop", icon: FontAwesome.shopping_bag, onPress: (){}, visible: true),
                  InstSearchButton(text: "Shop & Moview", icon: Icons.live_tv, onPress: (){}, visible: false),
                  InstSearchButton(text: "Food", icon: Icons.live_tv, onPress: (){}, visible: false),
                  InstSearchButton(text: "Gaming", icon: Icons.live_tv, onPress: (){}, visible: false),
                  InstSearchButton(text: "Nature", icon: Icons.live_tv, onPress: (){}, visible: false),
                  InstSearchButton(text: "Music", icon: Icons.live_tv, onPress: (){}, visible: false),

                ],
              ),
            ),
            Container(
              height: 500,
              child: FutureBuilder(
               future: getSearches(),
               builder: (context,snapshot){
               if(snapshot.hasData){
                 Map data =  snapshot.data;
                 return StaggeredGridView.builder(gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 4,
                   staggeredTileBuilder: (int index) =>
                   StaggeredTile.count(1, index.isOdd ? 1:2 ),
                   mainAxisSpacing: 4.0,
                   crossAxisSpacing: 4.0,
                 ),
                     itemBuilder: (context,int index){
                   return Container(
                       decoration: BoxDecoration(
                         image: DecorationImage(image: NetworkImage(data['hits'][index]['userImageURL']),fit: BoxFit.fill)
                       ),
                   );
                 }
                 );
               }else if(snapshot.hasError){
                  return Center(
                    child: Text("Check internet connection" , style: TextStyle(fontFamily: 'Sans',color: Colors.black),),
                  );
               }
               return Center(
                 child: CircularProgressIndicator(strokeWidth: 1,),
               );
              }),
            )
          ],
        ),
      ),
    );
  }
}


void getallPic() async{
  Map data = await getSearches();
  int i;
  for(i =0; i<data.length; i++){
    print(data[i]['hits']['user']);
  }
   return data[i];
}
