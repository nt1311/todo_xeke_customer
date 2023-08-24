import 'package:flutter/material.dart';
import 'package:todo_xeke_customer/config/constants/app_colors.dart';

class ButtonStyleWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonStyleWidget({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: NEUTRAL_GREY_5_COLOR,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 105),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(343, 44),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
