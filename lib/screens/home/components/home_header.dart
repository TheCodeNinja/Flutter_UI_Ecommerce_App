import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

import '../components/search_field.dart';
import '../components/badge_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Search Field
          SearchField(),

          // Cart Icon
          BadgeButton(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () {},
          ),
          
          // Bell Icon
          Text("bell"),
        ],
      ),
    );
  }
}