import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

class CustomAppBar extends PreferredSize {

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        // ~~~~~~~~~~~~~~~~~
        // a row of widgets
        // ~~~~~~~~~~~~~~~~~
        child: Row(
          children: [
            Text("back-arrow"),
            Spacer(),
            Text("rating"),
          ],
        ),
      ),
    );
  }
}