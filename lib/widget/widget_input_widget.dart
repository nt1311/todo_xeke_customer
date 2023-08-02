import 'package:flutter/material.dart';
import 'package:todo_xeke_customer/config/constants/app_colors.dart';

class InputWidget extends StatelessWidget {
  final String? hintText;
  final InputBorder? border;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;

  const InputWidget({
    super.key,
    this.hintText,
    this.border,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(13),
        hintText: hintText,
        hintStyle: TextStyle(color: NEUTRAL_GREY_3_COLOR),
        // Đặt màu cho hintText tại đây
        suffixIcon: suffixIcon,
        fillColor: Colors.black26,
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
      ),
    );
  }
}
