import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';

class FeedBackCard extends StatelessWidget {
  final String username;
  final String email;
  final List<dynamic> feedbacks;
  const FeedBackCard({
    super.key,
    required this.username,
    required this.email,
    required this.feedbacks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              email,
              style: const TextStyle(
                color: AppColor.grayDark,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "${"Feedbacks".tr}: ",
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            ...List.generate(
              feedbacks.length,
              (i) => Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "${i + 1}- ${feedbacks[i]}",
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
