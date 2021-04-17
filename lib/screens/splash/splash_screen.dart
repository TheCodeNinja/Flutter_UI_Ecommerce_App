import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/screens/splash/components/body.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // call it on the starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}