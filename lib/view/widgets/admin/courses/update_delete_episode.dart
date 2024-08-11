import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/courses/update_delete_episode_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../home/profile/my_account/custom_text_field_profile.dart';

class UpdateDeleteEpisode extends StatelessWidget {
  const UpdateDeleteEpisode({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateDeleteEpisodeControllerImp>(
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
                children: [
                  Text(
                    "You can update it Or delete it episode :".tr,
                    style: const TextStyle(
                      color: AppColor.textColorRed,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  CustomTextFieldProfile(
                    controller: controller.title,
                    hintText: "Enter the title of episode in english".tr,
                    labelText: "Title of episode in english".tr,
                    validator: (val) {
                      return vaildInput(val!, '');
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFieldProfile(
                    controller: controller.titleAr,
                    hintText: "Enter the title of episode in arabic".tr,
                    labelText: "Title of episode in arabic".tr,
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
                    controller: controller.url,
                    hintText: "Enter the url of the Episode".tr,
                    labelText: "url of the Episode".tr,
                    validator: (val) {
                      return vaildInput(val!, 'url');
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
                                controller.updateEpisode();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              icon: const Icon(Icons.replay_outlined),
                              label:  Text("Update Episode".tr),
                            ),
                      const SizedBox(width: 10),
                      controller.isLoadingDelete
                          ? const CircularProgressIndicator()
                          : ElevatedButton.icon(
                              onPressed: () {
                                controller.deleteEpisode();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              icon: const Icon(Icons.delete),
                              label:  Text("Delete Episode".tr),
                            ),
                    ],
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
