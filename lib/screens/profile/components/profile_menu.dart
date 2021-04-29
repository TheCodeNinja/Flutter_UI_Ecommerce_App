import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // [TextButton]
      child: TextButton(
        // style
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0xFFF5F6F9)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
        // action
        onPressed: press,
        // # [Row]
        child: Row(
          children: [
            // ## [SvgPicture]
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            // ## [SizedBox]
            SizedBox(width: 20),
            // ## [Text]
            Text(text),
            // ## [Spacer]
            Spacer(), // Expanded(child: Text(text)),
            // ## [Icon]
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}