import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/models/Product.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {

    final ProductDetailsArguments args =
      ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // we are going to create a custom app bar, as the default appBar 
      // donen't provide enough space for the screen's go-back icon
      appBar: CustomAppBar(rating: args.product.rating),
      body: Body(),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({
    @required this.product,
  });
}