import 'package:eye_on_palestine/controller/courses/course_controller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/courses/icon_row_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_button_small.dart';

class Course extends GetView<CourseControllerImp> {
  final Widget player;
  const Course({required this.player, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          player,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description :".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  translationData(
                    en: controller.selectedCourse.description,
                    ar: controller.selectedCourse.descriptionAr,
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColor.textColorRed,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24),
                Text(
                  "This course includes :".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                IconRowSvg(
                  text: "${controller.selectedCourse.duration} ${"Hours".tr}",
                  icon: AppImages.clockIcon,
                ),
                const SizedBox(height: 10),
                IconRowSvg(
                  text:
                      "${controller.selectedCourse.numOfEpisodes} ${"Episodess".tr}",
                  icon: AppImages.episodeIcon,
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          GetBuilder<CourseControllerImp>(
            builder: (_) {
              return Container(
                alignment: Alignment.center,
                child: controller.isLoading
                    ? const CircularProgressIndicator()
                    : controller.checkHasCourse
                        ? CustomButtonSmall(
                            onPressed: () {
                              controller.goToCourse();
                            },
                            text: "Go to this course".tr,
                            width: Get.width,
                            height: 60,
                            borderRadius: 0,
                          )
                        : CustomButtonSmall(
                            onPressed: () {
                              controller.addCourse();
                            },
                            text: "Add this course".tr,
                            width: Get.width,
                            height: 60,
                            borderRadius: 0,
                          ),
              );
            },
          ),
        ],
      ),
    );
  }
}
