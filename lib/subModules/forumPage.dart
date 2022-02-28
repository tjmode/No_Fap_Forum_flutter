// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, file_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:no_fap_forum/animations/showUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:no_fap_forum/Networks/network.dart';
import 'package:no_fap_forum/Model/userMessage.dart';
import 'dart:async';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  int delayAmount = 500;
  late Timer timer;
  int counter = 0;

  List<UserMessage> userMessage = <UserMessage>[];
  TextEditingController message = TextEditingController();
  void convertFutureListToList() async {
    Future<List<UserMessage>> _futureOfList = getRequest();
    userMessage = await _futureOfList;
    userMessage = List.from(userMessage.reversed);
    setState(() {});
  }

  void reload() {
    convertFutureListToList();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    convertFutureListToList();
    timer = Timer.periodic(Duration(seconds: 30), (Timer t) => reload());
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/superMan10.jpeg"),
                    fit: BoxFit.fill)),
            child: Container(
              color: Colors.black.withOpacity(0.8),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height / 25,
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            "Post your doubts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Courier',
                                fontSize: 18),
                          )),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          tooltip: 'Close this view',
                          onPressed: () {
                            Navigator.of(context, rootNavigator: false)
                                .pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    constraints: BoxConstraints(maxHeight: 250),
                    child: SingleChildScrollView(
                      child: TextField(
                        controller: message,
                        maxLines: 4,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white10,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white30, width: 2.0),
                          ),
                          labelText: "Ask or aswers doubts",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // margin: const EdgeInsets.only(left: 50, right: 40),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () async {
                          var text = message.text;
                          message.text = "";
                          if (text != '' && text != " ") {
                            postQuestion(text);
                            await Future.delayed(const Duration(seconds: 5),
                                () {
                              convertFutureListToList();
                            });
                          }
                        },
                        child: const Text('post'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width - 40,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 2,
                    // width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: userMessage.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            // height: 100,
                            // color: Colors.amber,
                            width: 100,
                            child: ChatView(
                                userMessage[index].userMessage,
                                userMessage[index].userName,
                                userMessage[index].id),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatView extends StatefulWidget {
  ChatView(this.message, this.userName, this.userId);
  String userName;
  String message;
  int userId;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  var itsSameUser = false;
  void checForUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userIdSaved = prefs.getInt('UserId');
    if (widget.userId == userIdSaved) {
      itsSameUser = true;
    }
  }

  @override
  void initState() {
    checForUser();
  }

  @override
  Widget build(BuildContext context) {
    checForUser();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.all(10),
            height: 20,
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.userName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: itsSameUser ? Colors.purple : Colors.white,
                  fontFamily: 'Courier',
                  fontSize: 12),
            )),
        Container(
          //width: 200,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: itsSameUser ? Colors.white : Colors.grey,
              //boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 3)],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15))),
          child: Container(
              margin: EdgeInsets.all(10), child: Text(widget.message)),
        ),
        SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
