import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/courses/add_episode_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../home/profile/my_account/custom_text_field_profile.dart';

class AddEpisode extends StatelessWidget {
  const AddEpisode({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEpisodeControllerImp>(builder: (controller) {
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
                  "Fill all of these field :".tr,
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
                  labelText: "Url of the episode".tr,
                  validator: (val) {
                    return vaildInput(val!, 'url');
                  },
                ),
                const SizedBox(height: 20),
                controller.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton.icon(
                        onPressed: () {
                          controller.addEpisode();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: const Icon(Icons.add),
                        label: Text("Add Episode".tr),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
