import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonSmall extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double width;
  final double height;
  final Color? color;
  final double borderRadius;
  const CustomButtonSmall({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 150,
    this.height = 35,
    this.color = AppColor.textColorRed,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
