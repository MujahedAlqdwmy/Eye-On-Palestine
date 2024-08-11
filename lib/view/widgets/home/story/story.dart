import 'package:eye_on_palestine/controller/story_controller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    StoryControllerImp controller = Get.put(StoryControllerImp());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            SvgPicture.asset(AppImages.stroryIcon),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: AppColor.textColorRed,
                  width: 2,
                ),
              ),
              child: Text(
                translationData(
                  en: controller.story,
                  ar: controller.storyAr,
                ),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color(0xff360202),
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
