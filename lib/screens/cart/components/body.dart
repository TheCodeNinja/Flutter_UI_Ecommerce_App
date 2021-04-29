import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/models/Cart.dart';

import '../components/cart_item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // how long
      itemCount: demoCarts.length,
      // build widget
      // map each index item to component
      itemBuilder: (BuildContext context, int index) {
        return CartItemCard(cartItem: demoCarts[index]); 
      },
    );
  }
}
