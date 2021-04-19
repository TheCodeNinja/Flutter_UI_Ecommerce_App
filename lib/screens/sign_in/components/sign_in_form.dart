import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_ecommerce_ui_app/screens/login_success/login_success_screen.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

// import components
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      // Build a Form widget using the _formKey created above.
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordTextFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              // You can use the _formKey.currentState() method to access the FormState,
              // which is automatically created by Flutter when building a Form.
              // The FormState class contains the validate() method.
              // Validate() returns true if the form is valid, or false otherwise.
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // navigate to login success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      // hide input
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          // remove empty error message from errors array
          setState(() { 
            errors.remove(kPassNullError);
          });
        } else if (
          value.isEmpty ||
          value.length > 8 &&
          errors.contains(kShortPassError)
        ){
          setState(() {
            // remove invalid error message from errors array
            errors.remove(kShortPassError);
          });
        }
        // pass email check
        return null;
      },
      validator: (value) {
        // empty password, and
        // not contain empty password error message
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          // add empty error message to errors array
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        // not empty password, and
        // short length password, and
        // not contain short length error message
        } else if (
          value.isNotEmpty &&
          value.length < 8 &&
          !errors.contains(kShortPassError)
        ){
          // add short length error message to errors array
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        // pass password check
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // use dependency flutter_svg
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          // remove empty error message from errors array
          setState(() { 
            errors.remove(kEmailNullError);
          });
        } else if (
          value.isEmpty ||
          emailValidatorRegExp.hasMatch(value) &&
          errors.contains(kInvalidEmailError)
        ){
          setState(() {
            // remove invalid error message from errors array
            errors.remove(kInvalidEmailError);
          });
        }
        // pass email check
        return null;
      },
      validator: (value) {
        // empty email, and
        // not contain empty email error message
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          // add empty error message to errors array
          setState(() { 
            errors.add(kEmailNullError);
          });
          return "";
        // not empty email, and
        // invalid email pattern, and
        // not contain invalid email error message, and
        } else if (
          value.isNotEmpty &&
          !emailValidatorRegExp.hasMatch(value) &&
          !errors.contains(kInvalidEmailError)
        ){
          setState(() {
            // add invalid error message to errors array
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        // pass email check
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // use dependency flutter_svg
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}