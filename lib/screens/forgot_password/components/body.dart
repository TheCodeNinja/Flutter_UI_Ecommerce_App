import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

// import components
import '../../../components/custom_suffix_icon.dart'; 
import '../../../components/form_error.dart'; 
import '../../../components/default_button.dart'; 

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Forgot Password",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Please enter your email and we will send \nyou a link to return to your account",
            textAlign: TextAlign.center,
          ),
          ForgotPasswordForm(),
        ],
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  List<String> errors = [];
  String email;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
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
          ),
          FormError(errors: errors),
          DefaultButton(
            text: "Continue",
            press: () {},
          ),
        ],
      ),
    );
  }
}