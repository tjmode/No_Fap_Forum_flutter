// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:carousel_slider/carousel_slider.dart';
import 'package:no_fap_forum/cells/whyCell.dart';
import 'package:flutter/material.dart';
import 'cells/forumCell.dart';
import 'cells/tipsCell.dart';
import 'cells/benefits.dart';
import 'cells/Myrank.dart';
import 'cells/GameCell.dart';
import 'animations/showUp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int delayAmount = 500;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/superMan.jpeg"), fit: BoxFit.fill)),
          child: Container(
            color: Colors.black.withOpacity(0.9),
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.height / 6,
                      //color: Colors.red.withOpacity(0.5),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          //  height: MediaQuery.of(context).size.height / 6,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          // autoPlayInterval: Duration(seconds: 0),
                          // autoPlayAnimationDuration: Duration(milliseconds: 10),
                          autoPlayCurve: Curves.ease,
                        ),
                        items: [
                          "assets/banner1.png",
                          "assets/banner2.png",
                          "assets/banner3.png",
                        ].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image(
                                    image: AssetImage(i),
                                    fit: BoxFit.fill,
                                  ));
                            },
                          );
                        }).toList(),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(" Things To do ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: <Widget>[
                      ShowUp(delay: delayAmount + 200, child: FourmCall()),
                      ShowUp(delay: delayAmount + 200, child: WhyWeNeed()),
                      ShowUp(delay: delayAmount + 200, child: TipsCell()),
                      ShowUp(delay: delayAmount + 200, child: BenefitCell()),
                      ShowUp(delay: delayAmount + 200, child: GamesList()),
                      ShowUp(delay: delayAmount + 200, child: MyRank()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
