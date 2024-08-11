import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../controller/courses/course_controller.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/home/courses/course.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseControllerImp controller = Get.put(CourseControllerImp());
    return YoutubePlayerScaffold(
        controller: controller.youtubePlayerController,
        aspectRatio: 16 / 9,
        autoFullScreen: false,
        enableFullScreenOnVerticalDrag: false,
        builder: (ctx, player) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.bgColor,
              appBar: customAppBar(
                title: translationData(
                  en: controller.selectedCourse.title,
                  ar: controller.selectedCourse.titleAr,
                ),
              ),
              body: GetBuilder<CourseControllerImp>(builder: (_) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Course(player: player);
              }),
            ),
          );
        });
  }
}
