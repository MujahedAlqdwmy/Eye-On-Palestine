import 'package:eye_on_palestine/view/widgets/home/profile/my_courses/custom_circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';

class MyCourseCard extends StatelessWidget {
  final String title;
  final String courseID;
  final double percent;

  const MyCourseCard({
    super.key,
    required this.title,
    required this.courseID,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.courseCard,
          ),
          fit: BoxFit.fill,
        ),
      ),
      height: 220,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.textColorRed,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  "Your Progress in this course".tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomCircularIndicator(
                percent: double.parse(percent.toStringAsFixed(3)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
