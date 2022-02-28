import 'package:flutter/material.dart';
import 'package:no_fap_forum/animations/showUp.dart';

class BeneFitPage extends StatefulWidget {
  const BeneFitPage({Key? key}) : super(key: key);

  @override
  _BeneFitPageState createState() => _BeneFitPageState();
}

class _BeneFitPageState extends State<BeneFitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 19),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 0, 0, 19),
          child: Column(
            children: const [
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
        const SizedBox(
          height: 50,
        ),
        const PutLine(),
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
                """It has several health benefits, from better sleep and muscle tone to heightened testosterone and mental clarity
                 """,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20))),
        const PutLine(),
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text("The mental benefits",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25))),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: const Text(""" -> Less stress and anxiety

-> Greater happiness and self-acceptance
            
-> Increased willpower and motivation
            
-> a boost of self-confidence
            
-> feeling more in touch with their spiritual sides
            
-> a deeper appreciation and respect for the opposite sex
                 """,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20))),
        const PutLine(),
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text("The physical benefits",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25))),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: const Text("""-> More energy
            
-> Better sleep

-> Stronger muscles

-> Laser-sharp concentration

-> Improved stamina and physical performance
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
          image: AssetImage("assets/capPage2.jpeg"),
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
              child: const Text("Benefits of Following NoFap.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
