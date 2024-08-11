import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';

class CustomTextDistance extends StatelessWidget {
  final double distance;
  const CustomTextDistance({super.key, required this.distance});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              "${distance.toStringAsFixed(2)} ${"KM".tr}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.textColorRed,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              "from Al-Aqsa Mosque".tr,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
