import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      // alignment
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children
      children: [
        // children widget text
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        // children widget text with gesture detector
        GestureDetector(
          onTap: press,
          child: Text(
            "See More",
            style: TextStyle(
              color: Color(0xFFBBBBBB),
            ),
          ),
        ),
      ],
    );
  }
}