import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return [SizedBox]
    return SizedBox(
      // size
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      // child widget [TextButton]
      child: TextButton(
        // style
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),
        // action
        onPressed: () => Navigator.pop(context),
        // child widget [SvgPicture]
        child: SvgPicture.asset(
          "assets/icons/Back ICon.svg",
          height: 15,
        ),
      ),
    );
  }
}
