import 'package:flutter/material.dart';
import 'package:food_delivery/constances/Styes.dart';

class OptionButton extends StatelessWidget {
  final void Function()? actionTakenOnCartItem;
  final Color buttonColor;
  final String buttonLabel;
  const OptionButton({
    super.key,
    required this.buttonColor,
    required this.buttonLabel,
    required this.actionTakenOnCartItem,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      onPressed: actionTakenOnCartItem,
      child: Text(
        buttonLabel,
        style: Styles.buttonTextStyle,
      ),
    );
  }
}
