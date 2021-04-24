import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/models/Product.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

import '../components/product_images.dart';

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
        
        Container(
          width: SizeConfig.screenWidth,
          color: Colors.white,
          child: Column(
            children: [
              // product description
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("product-description"),
                  ],
                ),
              ),
              // icon buttons and default button
              Container(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("color-dots"),
                        SizedBox(width: 10),
                        Text("color-dots"),
                        SizedBox(width: 10),
                        Text("color-dots"),
                        SizedBox(width: 10),
                        Text("color-dots"),
                      ],
                    ),
                    Text("button"),
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