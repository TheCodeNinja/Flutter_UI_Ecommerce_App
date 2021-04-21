import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

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
            Text("Header"),
             
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