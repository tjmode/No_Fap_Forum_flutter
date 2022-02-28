import 'package:flutter/material.dart';
import 'package:no_fap_forum/animations/showUp.dart';

class WhyNoFapPage extends StatefulWidget {
  const WhyNoFapPage({Key? key}) : super(key: key);

  @override
  _WhyNoFapPageState createState() => _WhyNoFapPageState();
}

class _WhyNoFapPageState extends State<WhyNoFapPage> {
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
              const ShowUp(delay: 100, child: UpperDesign()),
              SizedBox(
                height: 25,
              ),
              PutLine(),
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
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
                """NoFap is an anti-masturbation movement. Supporters say avoiding masturbation for prolonged periods improves their lives and sexuality. Some people may join for religious or ethical reasons, or because they worry about the effects of masturbation on their lives.
                “NoFap® is a comprehensive community-based porn recovery website. We offer all the tools our users need to connect with a supportive community of individuals determined to quit porn use and free themselves from compulsive sexual behaviors. With our website, forums, articles and apps, NoFap helps our users overcome their sexual addictions so they can heal from porn-induced sexual dysfunctions, improve their relationships, and ultimately live their most fulfilling lives.”
                """,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20))),
        const PutLine(),
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text("Why NoFap?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25))),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: const Text(
                """ NoFap is Not only quiting Fapping and porn, Its also all about stoping it and doing something productively Like creating bussiness or focusing in life growth part 

                - potential benefits is We’ll start with higher testosterone levels and its has more Mental benefits and Physical benefits. (More Listed in Benefit page) """,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20))),
        const PutLine(),
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text("Why No Fap is Hard ?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25))),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: const Text(
                """ NoFap is hard because people are unprepared so they relapse easily and they do not have any mastery of themselves. 

                - We live in a society of instant gratification and that may have long term effects on our psyche. 

                - NoFap is truly about creating 'discipline' in yourself. Once you have that discipline it trickles down into other facets of your life and thus makes you a better person. So if you are not disciplined then you cannot master yourself and thus NoFap is hard.""",
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
          image: AssetImage("assets/capWhy.jpg"),
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
              child: const Text("what is 'Nofap'.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25)),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              margin: const EdgeInsets.only(left: 20, top: 5, bottom: 30),
              child: const Text("And Why its Hard",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
