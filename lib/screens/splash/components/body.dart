import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';

// for importing components, this relative path is best practice
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                buildDot(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot() {
    return Container(
      // container properties
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
      margin: EdgeInsets.only(right: 5),
    );
  }
}
