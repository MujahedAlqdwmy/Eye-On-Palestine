import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAccount extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  const CustomButtonAccount({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        icon: Icon(icon),
        label: Text(text),
      ),
    );
  }
}
