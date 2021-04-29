import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/models/Cart.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    this.cartItem,
  }) : super(key: key);

  final Cart cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // # [SizedBox]
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88, // a ratio of width to height
            // ## [Container]
            child: Container(
              // padding, margin, size
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              // border, color, shape
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              // ### [Image]
              child: Image.asset(cartItem.product.images[0]),
            ),
          ),
        ),
        // # [SizedBox]
        SizedBox(width: 20),
        // # [Column]
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ## [Text]
            Text(
              cartItem.product.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              maxLines: 2,
            ),
            // ## [SizedBox]
            SizedBox(height: 10),
            // ## [Text.rich]
            Text.rich(
              // ### [TextSpan]
              TextSpan(
                text: "\$${cartItem.product.price}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
                children: [
                  // #### [TextSpan]
                  TextSpan(
                    text: " x${cartItem.numOfItem}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
