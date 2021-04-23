import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/models/Product.dart';
import 'package:flutter_ecommerce_ui_app/screens/details/details_screen.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    // return widget sized box with padding
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        // widget column
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
          ),
          child: Column(
            // alignment
            crossAxisAlignment: CrossAxisAlignment.start,
            // children
            children: [
              // # container with aspect ratio
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  // size, padding, margin
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  // shpae, color
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // child widget
                  child: Image.asset(product.images[0]),
                ),
              ),
              // # space
              SizedBox(height: 10),
              // # text
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              // # row for price and favorite icon
              Row(
                // alignment
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // children widget
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      // size, padding, margin
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      // shape, color
                      decoration: BoxDecoration(
                        color: product.isFavourite
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      // child widget
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product.isFavourite
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}