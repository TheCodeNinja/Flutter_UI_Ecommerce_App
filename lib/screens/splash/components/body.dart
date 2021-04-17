import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';

// for importing components, this relative path is best practice
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Ninja shop",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people connect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                text: splashData[index]["text"],
                image: splashData[index]["image"],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Row(
                  children: List.generate(
                    splashData.length, 
                    (index) => buildDot(index: index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({ int index }) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      // container properties
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
      margin: EdgeInsets.only(right: 5),
    );
  }
}
