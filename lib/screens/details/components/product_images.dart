import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/models/Product.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

class ProductImages extends StatefulWidget {

   const ProductImages({
     Key key,
     @required this.product,
   }) : super(key: key);

   final Product product;
   
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {

  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.product.images[selectedImage]),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("thumbnails"),
            SizedBox(width: 10),
            Text("thumbnails"),
          ],
        )
      ],
    );
  }
}