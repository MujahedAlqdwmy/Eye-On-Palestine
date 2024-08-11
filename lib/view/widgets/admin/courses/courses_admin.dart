import 'package:eye_on_palestine/controller/admin/courses/courses_admin_controller.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/admin/courses/course_card_admin.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_button_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';

class CoursesAdmin extends GetView<CoursesAdminControllerImp> {
  const CoursesAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          children: [
            Text(
              'Upper text courses admin'.tr,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GetBuilder<CoursesAdminControllerImp>(
              builder: (controller) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: controller.courses.length * 220,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.courses.length,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.goToUpdateOrDeleteCourse(
                                    controller.courses[index]);
                              },
                              child: CourseCardAdmin(
                                courseID: controller.courses[index].id,
                                title: translationData(
                                  en: controller.courses[index].title,
                                  ar: controller.courses[index].titleAr,
                                ),
                                description: translationData(
                                  en: controller.courses[index].description,
                                  ar: controller.courses[index].descriptionAr,
                                ),
                                participants:
                                    controller.courses[index].numOfParticipants,
                                favorites:
                                    controller.courses[index].numOfFavorites,
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
            const SizedBox(height: 20),
            CustomButtonSmall(
              text: "Add new one".tr,
              onPressed: () {
                controller.goToAddCourse();
              },
            ),
          ],
        ),
      ),
    );
  }
}
