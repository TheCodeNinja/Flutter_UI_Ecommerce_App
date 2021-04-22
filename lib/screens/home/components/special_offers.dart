import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

import '../components/section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // widget with padding
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        // widget
        SingleChildScrollView(
          // alignment
          scrollDirection: Axis.horizontal,
          // child widget row
          child: Row(
            children: [
              Text("SpecialOfferCard"),
              SizedBox(width: getProportionateScreenWidth(20)),
              Text("SpecialOfferCard"),
              SizedBox(width: getProportionateScreenWidth(20)),
              Text("SpecialOfferCard"),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}
