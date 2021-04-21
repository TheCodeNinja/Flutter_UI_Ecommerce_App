import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BadgeButton extends StatelessWidget {
  const BadgeButton({
    Key key,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final String svgSrc;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      // child widget Container
      child: Container(
        // size and shape
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenWidth(46),
        width: getProportionateScreenWidth(46),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        // child widget
        child: SvgPicture.asset(svgSrc),
      ),
    );
  }
}