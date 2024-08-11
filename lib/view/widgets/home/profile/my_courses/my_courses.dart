import 'package:eye_on_palestine/controller/profile/my_courses_controller.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';

import 'my_course_card.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GetBuilder<MyCoursesControllerImp>(
              builder: (controller) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: controller.myCourses.length * 240,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.myCourses.length,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                controller
                                    .goToCourse(controller.myCourses[index].id);
                              },
                              child: MyCourseCard(
                                courseID: controller.myCourses[index].id,
                                title: translationData(
                                  en: controller.myCourses[index].title,
                                  ar: controller.myCourses[index].titleAr,
                                ),
                                percent:
                                    controller.myCourses[index].numOfComplete !=
                                            0
                                        ? controller.myCourses[index]
                                                .numOfComplete /
                                            controller
                                                .myCourses[index].numOfEpisodes
                                        : 0,
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
