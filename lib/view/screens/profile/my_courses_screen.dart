import 'package:eye_on_palestine/controller/profile/my_courses_controller.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/my_courses/completed_courses.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/my_courses/my_courses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/home/profile/my_courses/custom_app_bar_my_courses.dart';
import '../../widgets/home/profile/my_courses/my_favorites.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBarMyCourses(title: 'My Courses'.tr),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.delete<MyCoursesControllerImp>();
            Get.put(MyCoursesControllerImp());
            await Future.delayed(const Duration(seconds: 2));
          },
          child: const TabBarView(
            children: [
              MyCourses(),
              MyFavorites(),
              CompletedCourses(),
            ],
          ),
        ),
      )),
    );
  }
}
