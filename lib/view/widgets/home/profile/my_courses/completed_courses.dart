import 'package:eye_on_palestine/controller/profile/my_courses_controller.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';

import 'my_course_card.dart';

class CompletedCourses extends StatelessWidget {
  const CompletedCourses({super.key});

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
                        height: controller.completedCourses.length * 240,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.completedCourses.length,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.goToCourse(
                                    controller.completedCourses[index].id);
                              },
                              child: MyCourseCard(
                                courseID: controller.completedCourses[index].id,
                                title: translationData(
                                  en: controller.completedCourses[index].title,
                                  ar: controller
                                      .completedCourses[index].titleAr,
                                ),
                                percent: 1,
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
