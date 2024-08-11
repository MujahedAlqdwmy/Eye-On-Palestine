import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final AlignmentGeometry? alignment;
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.buttonColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
