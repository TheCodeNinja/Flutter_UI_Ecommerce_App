import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
