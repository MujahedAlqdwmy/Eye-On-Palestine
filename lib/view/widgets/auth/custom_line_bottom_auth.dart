import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomLineBottomAuth extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onPressed;
  const CustomLineBottomAuth({
    super.key,
    required this.text1,
    required this.text2,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 12,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text2,
            style: TextStyle(
              color: AppColor.buttonColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
