import 'package:eye_on_palestine/controller/courses/course_episods_conreoller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/courses/episode_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseEpisods extends GetView<CourseEpisodsControllerImp> {
  const CourseEpisods({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description :".tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: AppColor.textColorRed,
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
                height: 1.6,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Text(
              "Episodes".tr,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.textColorRed,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            GetBuilder<CourseEpisodsControllerImp>(builder: (_) {
              return controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.episodes.length,
                      itemBuilder: (ctx, index) {
                        final episode = controller.episodes[index];
                        return InkWell(
                          onTap: () {
                            controller.goToEpisode(episode);
                          },
                          child: EpisodeCard(
                            title:
                                "${index + 1}- ${translationData(en: episode.title, ar: episode.titleAr)}",
                            checkValue: episode.checkComplete,
                          ),
                        );
                      },
                    );
            })
          ],
        ),
      ),
    );
  }
}
