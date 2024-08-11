import 'package:eye_on_palestine/controller/admin/courses/update_delete_course_controller.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../home/courses/episode_card.dart';
import '../../home/custom_button_small.dart';
import '../../home/profile/my_account/custom_text_field_profile.dart';

class UpdateDeleteCourse extends StatelessWidget {
  const UpdateDeleteCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateDeleteCourseControllerImp>(
      builder: (controller) {
        return Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "You can update it Or delete it :".tr,
                      style: const TextStyle(
                        color: AppColor.textColorRed,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextFieldProfile(
                    controller: controller.title,
                    hintText: "Enter the title of course in english".tr,
                    labelText: "Title of course in english".tr,
                    validator: (val) {
                      return vaildInput(val!, '');
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFieldProfile(
                    controller: controller.titleAr,
                    hintText: "Enter the title of course in arabic".tr,
                    labelText: "Title of course in arabic".tr,
                    validator: (val) {
                      return vaildInput(val!, '');
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFieldProfile(
                    controller: controller.description,
                    hintText: "Enter the description in english".tr,
                    labelText: "English Description".tr,
                    height: 10,
                    validator: (val) {
                      return vaildInput(val!, '');
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFieldProfile(
                    controller: controller.descriptionAr,
                    hintText: "Enter the description in arabic".tr,
                    labelText: "Arabic Description".tr,
                    height: 10,
                    validator: (val) {
                      return vaildInput(val!, '');
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFieldProfile(
                    controller: controller.duration,
                    hintText: "Enter the duration of the course".tr,
                    labelText: "Duration of the course".tr,
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      return vaildInput(val!, '');
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.isLoadingUpade
                          ? const CircularProgressIndicator()
                          : ElevatedButton.icon(
                              onPressed: () {
                                controller.updateCourse();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              icon: const Icon(Icons.replay_outlined),
                              label: Text("Update Course".tr),
                            ),
                      const SizedBox(width: 10),
                      controller.isLoadingDelete
                          ? const CircularProgressIndicator()
                          : ElevatedButton.icon(
                              onPressed: () {
                                controller.deleteCourse();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              icon: const Icon(Icons.delete),
                              label: Text("Delete Course".tr),
                            ),
                    ],
                  ),
                  //============================= Episodes =====================
                  const SizedBox(height: 40),
                  Text(
                    "Episodes".tr,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColorRed,
                    ),
                    //textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 40),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.episodes.length,
                    itemBuilder: (ctx, index) {
                      final episode = controller.episodes[index];
                      return InkWell(
                        onTap: () {
                          controller.goToUpdateDeleteEpisode(episode);
                        },
                        child: EpisodeCard(
                          title:
                              "${index + 1}- ${translationData(en: episode.title, ar: episode.titleAr)}",
                          checkValue: episode.checkComplete,
                        ),
                      );
                    },
                  ),
                  Center(
                    child: CustomButtonSmall(
                      text: "Add Episode".tr,
                      onPressed: () {
                        controller.goToAddEpisode();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
