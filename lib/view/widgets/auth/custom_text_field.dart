import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        fillColor: AppColor.fillFiledColor,
        focusColor: AppColor.fillFiledColorDark,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.textField,
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: AppColor.buttonColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: AppColor.buttonColor),
        ),
        errorStyle: TextStyle(
          color: AppColor.buttonColor,
          fontWeight: FontWeight.bold,
        ),
        suffixIconColor: AppColor.textField,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      controller: controller,
      validator: validator,
    );
  }
}
