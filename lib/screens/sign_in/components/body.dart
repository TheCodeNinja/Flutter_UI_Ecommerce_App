import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import components
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      // Build a Form widget using the _formKey created above.
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordTextFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Column(
            children: List.generate(errors.length, (index) => (
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Error.svg",
                    height: getProportionateScreenWidth(14),
                    width: getProportionateScreenWidth(14),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(errors[index]),
                ],
              )
            )),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              // You can use the _formKey.currentState() method to access the FormState,
              // which is automatically created by Flutter when building a Form.
              // The FormState class contains the validate() method.
              // Validate() returns true if the form is valid, or false otherwise.
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
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
      validator: (value) {
        // empty password, and
        // not contain empty password error message
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          // add empty error message to errors array
          setState(() {
            errors.add(kPassNullError);
          });
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
      validator: (value) {
        // empty email, and
        // not contain empty email error message
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          // add empty error message to errors array
          setState(() { 
            errors.add(kEmailNullError);
          });
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
