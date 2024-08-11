import 'package:eye_on_palestine/controller/profile/my_courses_controller.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/courses/course_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';

class MyFavorites extends StatelessWidget {
  const MyFavorites({super.key});

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
                        height: controller.myFavorites.length * 240,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.myFavorites.length,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.goToCourse(
                                    controller.myFavorites[index].id);
                              },
                              child: CourseCard(
                                courseID: controller.myFavorites[index].id,
                                title: translationData(
                                  en: controller.myFavorites[index].title,
                                  ar: controller.myFavorites[index].titleAr,
                                ),
                                description: translationData(
                                  en: controller.myFavorites[index].description,
                                  ar: controller
                                      .myFavorites[index].descriptionAr,
                                ),
                                favorites: controller
                                    .myFavorites[index].numOfFavorites,
                                participants: controller
                                    .myFavorites[index].numOfParticipants,
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
