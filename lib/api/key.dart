import 'dart:convert';
import 'package:http/http.dart' as http;
/*
* This is only used in the search bar to get unlimited content
 */

String ApiKey = "14904227-d058eb4b7bbfa44fea79647a9";
String status = "https://api.jsonbin.io/b/5e21a2505df640720836fb48/1";
String post = "https://api.jsonbin.io/b/5e21b0878d761771cc927e05";
String User ="https://api.jsonbin.io/b/5e2054058d761771cc91df41/3";
String users ="https://api.jsonbin.io/b/5e208ad45df64072083681fd/1";
/*
* Getting the data from the internet
 */

Future<Map> getSearches() async{
  String url = "https://pixabay.com/api/videos/?key=14904227-d058eb4b7bbfa44fea79647a9&q=nature&pretty=true";
  var response = await http.get(url);
  var data = json.decode(response.body);
  return data;
}

Future<Map> getUserInfo(http.Client client) async{
  String userinfo= User;
  var response = await client.get(userinfo);
  var data = json.decode(response.body);
  return data;
}

Future<Map> getUsers(http.Client client) async{
  String userinfo= users;
  var response = await client.get(userinfo);
  var data = json.decode(response.body);
  return data;
}

Future<Map> getPost() async{
  String posts = post;
  var response = await http.get(posts);
  var data = json.decode(response.body);
  return data;
}

Future<Map> getStatus() async{
  String url = status;
  var response = await http.get(url);
  var data = json.decode(response.body);
  return data;
}
/*
* Another way of psrsing Json.
* This calles Json Serialization
* */