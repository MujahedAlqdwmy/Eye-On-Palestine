import 'package:flutter/material.dart';

class CustomTextFieldFeedback extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  const CustomTextFieldFeedback({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
        border: InputBorder.none,
      ),
      textAlign: TextAlign.center,
      maxLines: 10,
    );
  }
}
