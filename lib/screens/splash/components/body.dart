import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Spacer(),
                Text(
                  "NINJA",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Welcome to our Ninja shop!"),
                Spacer(flex: 2),
                Image.asset(
                  "assets/images/splash_1.png",
                  height: getProportionateScreenHeight(265),
                  width: getProportionateScreenWidth(235),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container( // can be Column, Row, SizedBox
              color: Colors.amberAccent,
            ),
          ),
        ],
      ),
    );
  }
}
