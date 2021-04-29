import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/components/default_button.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // size, padding, margin
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // corlor, border, shape
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      // Container child widget
      // # [SafeArea]
      child: SafeArea(
        // ## [Column]
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ### [Row]
            Row(
              children: [
                SvgPicture.asset("assets/icons/receipt.svg"),
                Spacer(), // space between
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                ),
              ],
            ),
            // ### [SizedBox]
            SizedBox(height: getProportionateScreenHeight(20)),
            // ### [Row]
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // #### [Text.rich]
                Text.rich(
                  // ##### [TextSpan]
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      // ###### [TextSpan]
                      TextSpan(
                        text: "\$337.15",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(), // space between
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
