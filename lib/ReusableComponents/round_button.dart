import 'package:flutter/material.dart';
import 'package:food_delivery/constances/get_size.dart';

class ResueMatterialButton extends StatelessWidget {
  final Color colorInput;
  final Function()? onPressInput;
  final String textLabel;
  const ResueMatterialButton({
    super.key,
    this.onPressInput,
    required this.colorInput,
    required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: GetSize.getScreenHeight(16),
      ),
      child: Material(
        elevation: 7.0,
        color: colorInput,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressInput,
          minWidth: 200.0,
          height: GetSize.getScreenHeight(40.0),
          child: Text(
            textLabel,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
