import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/routes.dart';
import 'package:flutter_ecommerce_ui_app/screens/profile/profile_screen.dart';
import 'package:flutter_ecommerce_ui_app/screens/splash/splash_screen.dart';
import 'package:flutter_ecommerce_ui_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      routes: routes,
      // initialRoute: SplashScreen.routeName,
      initialRoute: ProfileScreen.routeName,
    );
  }
}
