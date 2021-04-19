import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

// import components
import '../components/sign_in_form.dart';
import '../../../components/social_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea( // exclude small space for top and bottom
      child: SizedBox(
        width: double.infinity, // let Column as wide as its parent SafeArea
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Welcome back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Sign in with your email and password \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SignInForm(),
              SocialCard(
                icon: "assets/icons/facebook-2.svg",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
