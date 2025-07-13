import 'package:flutter/material.dart';
import 'package:weather_app/Core/utils/fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  CustomElevatedButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xffDDB130)),
        onPressed: onTap,
        child: Text(
          label,
          style: Fonts().buttonTextStyle,
        ));
  }
}
