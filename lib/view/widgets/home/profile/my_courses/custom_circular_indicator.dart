import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../core/constants/app_colors.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double percent;
  const CustomCircularIndicator({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: CircularPercentIndicator(
        radius: 50,
        lineWidth: 11.0,
        percent: percent,
        center: Text(
          "${percent * 100}%",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.textColorRed,
          ),
        ),
        progressColor: AppColor.textColorRed,
        circularStrokeCap: CircularStrokeCap.round,
        animation: true,
        animationDuration: 1000,
      ),
    );
  }
}
