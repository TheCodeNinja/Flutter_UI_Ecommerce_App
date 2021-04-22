import 'package:flutter/material.dart';

import '../components/home_header.dart';
import '../components/discount_banner.dart';

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
            DiscountBanner(),

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