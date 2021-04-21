import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

import '../components/complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        // make it as wide as its parent widget
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                // == Title ==
                Text(
                  "Complete Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // == Subtitle ==
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                // == Profile Form ==
                // Text("Our Form Here"),
                CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                // Terms and Conditons Text
                Text(
                  "By continuing your confirm that you agree \nwith our Terms and Conditions",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}