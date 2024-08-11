import 'package:eye_on_palestine/controller/courses/courses_controller.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/courses/course_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_title_body_section.dart';

class Courses extends GetView<CoursesControllerImp> {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoursesControllerImp());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTitleAndBodySection(
              title: "Educational Courses".tr,
              body: "introduction courses screen".tr,
            ),
            const SizedBox(height: 16),
            GetBuilder<CoursesControllerImp>(builder: (_) {
              return controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: controller.courses.length * 240,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.courses.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.goToCourse(controller.courses[index]);
                            },
                            child: CourseCard(
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
            }),
          ],
        ),
      ),
    );
  }
}
