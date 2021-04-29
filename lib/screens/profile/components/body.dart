import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/screens/profile/components/profile_avatar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       padding: EdgeInsets.symmetric(vertical: 20),
       child: Column(
         children: [
           ProfileAvatar(),
           SizedBox(height: 20),
           Text("profile menu 1"),
           Text("profile menu 2"),
           Text("profile menu 3"),
           Text("profile menu 4"),
           Text("profile menu 5"),
         ],
       ),
     );
  }
}