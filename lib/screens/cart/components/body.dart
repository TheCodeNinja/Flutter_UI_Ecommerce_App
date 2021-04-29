import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/models/Cart.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/cart_item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        // how long
        itemCount: demoCarts.length,
        // build widget
        // map each index item to component
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              // key
              key: Key(demoCarts[index].product.id.toString()),
              // direction
              direction: DismissDirection.endToStart,
              // action
              onDismissed: (direction) {
                // remove the item from the data source
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              // "leave behind" indicator
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              // list itemBuilder widget
              child:CartItemCard(cartItem: demoCarts[index]),
            ),
          ); 
        },
      ),
    );
  }
}
