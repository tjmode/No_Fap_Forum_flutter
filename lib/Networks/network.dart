import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dart:async';
import 'package:no_fap_forum/Model/userMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';

makeLogin(String name) async {
  final uri = Uri.parse('http://bharatht2069.somee.com/api/ForumAPI/Login');
  final headers = {'Content-Type': 'application/json'};
  Map<String, dynamic> body = {
    'UserName': name,
    "Email": "barathpit2016@gmail.com",
    "Password": "12345"
  };
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  Response response = await post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );
  var res = json.decode(response.body);
  var dict = json.decode(res["data"]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("UserName", dict["UserName"]);
  prefs.setInt("UserId", dict["UserId"]);
}

postQuestion(String message) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userId = prefs.getInt('UserId');
  final uri =
      Uri.parse('http://bharatht2069.somee.com/api/ForumAPI/SaveMessage');
  final headers = {'Content-Type': 'application/json'};
  Map<String, dynamic> body = {
    'UserId': userId,
    "Message": message,
    "Email": "barathpit2016@gmail.com",
    "Password": "12345"
  };
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  Response response = await post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );
}

Future<List<UserMessage>> getRequest() async {
  //replace your restFull API here.
  final response = await http.get(
      Uri.parse('http://bharatht2069.somee.com/api/ForumAPI/GetAllMessages'));
  //Creating a list to store input data;
  List<UserMessage> users = [];
  var res = json.decode(response.body);
  var dict = json.decode(res["data"]);
  for (var i = 0; i < dict.length; i++) {
    UserMessage user = UserMessage(
        id: dict[i]["UserId"],
        userMessage: dict[i]["Message"],
        userName: dict[i]["UserName"]);
    users.add(user);
  }
  return users;
}
