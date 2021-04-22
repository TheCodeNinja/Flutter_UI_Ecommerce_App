import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

class DiscountBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // size, margin, padding
      // height: 90,
      width: double.infinity, // make it as wide as its parent widget
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      // shape
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      // child widget
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            color: Colors.white
          ),
          children: [
            TextSpan(
              text: "A Summer Suprise\n"
            ),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}