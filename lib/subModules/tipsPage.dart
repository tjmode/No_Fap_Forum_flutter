import 'package:flutter/material.dart';

import 'package:no_fap_forum/animations/showUp.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 19),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 0, 0, 19),
          child: Column(
            children: [
              ShowUp(delay: 100, child: UpperDesign()),
              ShowUp(delay: 200, child: BottomText())
            ],
          ),
        ),
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PutLine(),
        const SizedBox(
          height: 10,
        ),
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text("""

-> Use our App, will help ; )

->  Do not use instagram.

->  Don’t watch porn

-> keep always busy Yourself , don't let bad thought to come inside

-> Have a goal why you want to do no fap.

-> dont be alone

-> In order to succeed in Nofap you have to be busy all the time (Yes you can).

-> Watch any Series or Anime , which is free from sexuality.

-> Cold Showers . Cold Showers make you uncomfortable and new ideas pop in your Brain , your productivity also increases

-> listen music whenever you feel bored or you feel the urge.

            """,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20))),
      ],
    );
  }
}

class PutLine extends StatelessWidget {
  const PutLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 1,
        color: Colors.white,
        width: MediaQuery.of(context).size.width - 30,
      ),
    );
  }
}

class UpperDesign extends StatelessWidget {
  const UpperDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/superManCell1.jpeg"),
          fit: BoxFit.fill,
        ),
        color: Colors.black.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                tooltip: 'Close this view',
                onPressed: () {
                  Navigator.of(context, rootNavigator: false).pop(context);
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              margin: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
              child: const Text("Tips for 'Nofap'.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25)),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              margin: const EdgeInsets.only(left: 20, top: 5, bottom: 30),
              child: const Text("Always have your Discipline",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
