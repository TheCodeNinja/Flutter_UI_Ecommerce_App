import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      // [Stack]
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none, // overflow: Overflow.visible
        children: [
          // # [CircleAvatar]
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          // # [SizedBox with TextButton]
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox( // control the size of TextButton
              height: 46,
              width: 46,
              child: TextButton(
                // style
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFF5F6F9),
                  ),
                ),
                // action
                onPressed: () {},
                // ## [SvgPicture]
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
