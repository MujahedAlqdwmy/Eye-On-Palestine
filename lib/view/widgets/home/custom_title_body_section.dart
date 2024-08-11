import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomTitleAndBodySection extends StatelessWidget {
  final String title;
  final String body;
  const CustomTitleAndBodySection({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColor.textColorRed,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          body,
          style: const TextStyle(
            fontSize: 16,
            height: 1.7,
            color: AppColor.textField,
          ),
          textAlign: TextAlign.justify,
        ),
        body == "" ? const SizedBox() : const SizedBox(height: 20),
      ],
    );
  }
}
