import 'package:flutter/material.dart';

import '../components/home_header.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            HomeHeader(),
             
            // Discount Banner
            Text("Discount Banner"),

            // Categories
            Text("Categories"),

            // Special Offers
            Text("SpecialOffers"),
            
            // Popular Products
            Text("Popular Products"),
          ],
        ),
      ),
    );
  }
}