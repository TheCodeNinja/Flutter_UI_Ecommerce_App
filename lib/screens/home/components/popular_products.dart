import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

import '../components/section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // # title with padding
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SectionTitle(
            title: "Popular Products",
            press: () {},
          ),
        ),
        // # space
        SizedBox(height: getProportionateScreenWidth(20)),
        // # a row of list
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(20)),
              Text("product_card"),
              SizedBox(width: getProportionateScreenWidth(20)),
              Text("product_card"),
              SizedBox(width: getProportionateScreenWidth(20)),
              Text("product_card"),
              SizedBox(width: getProportionateScreenWidth(20)),
              Text("product_card"),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}