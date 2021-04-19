import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_ecommerce_ui_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_ecommerce_ui_app/screens/splash/splash_screen.dart';

// we use name routes
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};
