import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class EpisodeCard extends StatelessWidget {
  final String title;
  final bool checkValue;
  const EpisodeCard({
    super.key,
    required this.title,
    required this.checkValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColor.textColorRed,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
            ),
            Checkbox(
              activeColor: AppColor.textColorRed,
              value: checkValue,
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
