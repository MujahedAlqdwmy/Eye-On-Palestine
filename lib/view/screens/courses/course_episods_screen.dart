import 'package:eye_on_palestine/controller/courses/course_episods_conreoller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/translation_data.dart';
import '../../widgets/home/courses/course_episodes.dart';
import '../../widgets/home/custom_app_bar.dart';

class CourseEpisodsScreen extends GetView<CourseEpisodsControllerImp> {
  const CourseEpisodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CourseEpisodsControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(
          title: translationData(
            en: controller.selectedCourse.title,
            ar: controller.selectedCourse.titleAr,
          ),
        ),
        body: const CourseEpisods(),
      ),
    );
  }
}
