import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_ui_app/models/Product.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

import '../components/product_images.dart';
import '../components/top_rounded_container.dart';
import '../components/product_description.dart';
import '../components/color_dots.dart';
import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Body Top Section
        // ~~~~~~~~~~~~~~~~
        
        ProductImages(product: product),

        // Body Bottom Section
        // ~~~~~~~~~~~~~~~~~~~
        
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              // product description
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              // icon buttons and default button
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          top: getProportionateScreenWidth(15),
                          bottom: getProportionateScreenWidth(40),
                        ),
                        child: DefaultButton(
                          text: "Add to Cart",
                          press: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}