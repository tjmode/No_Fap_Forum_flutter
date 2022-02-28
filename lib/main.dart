// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'homePage.dart';
import 'package:flutter/services.dart';
// assets/cap.jpeg

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userId = prefs.getInt('UserId');
  runApp(MaterialApp(home: userId == null ? MyApp2() : HomePage()));
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  // Height (without SafeArea)
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/cap2.jpeg"), fit: BoxFit.fill)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 1.5),
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text("Hello.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Courier',
                              fontSize: 32)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Welcome to no fap fourm let become ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Courier',
                              color: Colors.white,
                              fontSize: 15)),
                      SizedBox(
                        height: 2,
                      ),
                      Text("Super hero with no fap power ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Courier',
                              color: Colors.white,
                              fontSize: 15)),
                      SizedBox(
                        height: 2,
                      ),
                      Text("its all you vs you ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Courier',
                              color: Colors.white,
                              fontSize: 15)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width - 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginPage()),
                              );
                            },
                            child: Text('Lets war'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
