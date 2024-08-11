import 'package:eye_on_palestine/controller/courses/course_episods_conreoller.dart';
import 'package:eye_on_palestine/controller/courses/episode_controller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Episode extends GetView<EpisodeControllerImp> {
  final Widget player;
  const Episode({
    required this.player,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height - 80,
        child: Column(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(),
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
                      en: controller.selectedEpisode.description,
                      ar: controller.selectedEpisode.descriptionAr,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.textColorRed,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
