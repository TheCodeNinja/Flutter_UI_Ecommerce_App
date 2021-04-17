import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  // create route name for this screen
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In")
      ),
    );
  }
}