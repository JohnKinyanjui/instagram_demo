import 'package:flutter/material.dart';
import 'package:instagram/api/constants.dart';

class StatusCircle extends StatelessWidget {
  final String status_link;
  final String name;

  StatusCircle({@required this.status_link,@required this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0,right: 5),
      child: Column(
        children: <Widget>[
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.0, 0.0, 1.0, 0.8],
                    colors: [color_1, color_2,color_3,color_4,color_5])
            ),
            child:  Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:  Colors.white
              ),
                child:  Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(status_link),fit: BoxFit.cover),
                      color: Colors.grey[300]
                    )

              ),
                ),
              ),
            ),
          ),
         Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'Sans'),),
          )
        ],
      ),
    );
  }
}
