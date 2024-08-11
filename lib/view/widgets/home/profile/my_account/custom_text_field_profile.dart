import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class CustomTextFieldProfile extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? enabled;
  final int height;
  final TextInputType? keyboardType;
  const CustomTextFieldProfile({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.suffixIcon,
    this.validator,
    this.enabled = true,
    this.height = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: height,
      cursorColor: AppColor.buttonColor,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        filled: true,
        fillColor: AppColor.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
          color: AppColor.textColorRed,
          fontSize: 18,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: AppColor.buttonColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: AppColor.buttonColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: AppColor.buttonColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: AppColor.buttonColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: AppColor.buttonColor),
        ),
        errorStyle: TextStyle(
          color: AppColor.buttonColor,
          fontWeight: FontWeight.bold,
        ),
        suffixIconColor: AppColor.gold,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
      validator: validator,
    );
  }
}
