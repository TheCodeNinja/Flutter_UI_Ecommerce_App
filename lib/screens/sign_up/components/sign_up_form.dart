import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/constants.dart';
import 'package:flutter_ecommerce_ui_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';

import '../../../components/form_error.dart';
import '../../../components/default_button.dart';
import '../../../components/custom_suffix_icon.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  String confirmPassword;
  String passwordConfirmNullError = "Please enter your confirm password";
  bool remember = false;

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passwordConfirmNullError);
        } else if (
          value.isNotEmpty &&
          password == confirmPassword
        ){
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
        return null;
      },
      validator: (value) {
        // show empty error
        if (value.isEmpty && !errors.contains(passwordConfirmNullError)) {
          addError(error: passwordConfirmNullError);
          return ""; // don't continue checking 
        // show invalid error
        } else if (
          value.isNotEmpty &&
          password != value &&
          !errors.contains(kMatchPassError)
        ){
          addError(error: kMatchPassError);
          return ""; // don't continue checking 
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          removeError(error: kPassNullError);
        } else if (
          value.length > 8 &&
          errors.contains(kShortPassError)
        ){
          removeError(error: kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          addError(error: kPassNullError);
          return ""; // don't continue checking 
        } else if (
          value.isNotEmpty &&
          value.length < 8 &&
          !errors.contains(kShortPassError)
        ){
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          // remove empty error message from errors array
          removeError(error: kEmailNullError);
        } else if (
          value.isEmpty ||
          emailValidatorRegExp.hasMatch(value) &&
          errors.contains(kInvalidEmailError)
        ){
          removeError(error: kInvalidEmailError);
        }
        // pass email check
        return null;
      },
      validator: (value) {
        // empty email, and
        // not contain empty email error message
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          // add empty error message to errors array
          addError(error: kEmailNullError);
          return "";
        // not empty email, and
        // invalid email pattern, and
        // not contain invalid email error message, and
        } else if (
          value.isNotEmpty &&
          !emailValidatorRegExp.hasMatch(value) &&
          !errors.contains(kInvalidEmailError)
        ){
          addError(error: kInvalidEmailError);
          return "";
        }
        // pass email check
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}