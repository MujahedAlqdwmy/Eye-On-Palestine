import 'package:eye_on_palestine/view/widgets/home/courses/icon_row.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class CourseCardAdmin extends StatelessWidget {
  final String title;
  final String description;
  final int participants;
  final int favorites;
  final String courseID;

  const CourseCardAdmin({
    super.key,
    required this.title,
    required this.description,
    required this.participants,
    required this.favorites,
    required this.courseID,
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
      height: 190,
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
          const SizedBox(height: 10),
          SizedBox(
            width: 250,
            height: 50,
            child: Text(
              description,
              style: const TextStyle(height: 1.4),
              overflow: TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              IconRow(
                icon: Icons.visibility_outlined,
                text: "$participants",
              ),
              const SizedBox(width: 40),
              IconRow(
                icon: Icons.favorite_border,
                color: Colors.black,
                text: "$favorites",
              ),
            ],
          )
        ],
      ),
    );
  }
}
