import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';

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
            child: Container( // can be Column, Row, SizedBox
              color: Colors.deepOrangeAccent,
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
