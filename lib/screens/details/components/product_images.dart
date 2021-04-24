import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
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
            ...List.generate(
              // how long
              widget.product.images.length,
              // build widget
              (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      // action
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      // # child widget [AnimatedContainer]
      child: AnimatedContainer(
        // how long
        duration: defaultDuration,
        // size, padding, margin
        margin: EdgeInsets.symmetric(horizontal: 7.5),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        // border, color
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        // ## child widget [Image]
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}