import 'package:eye_on_palestine/controller/admin/story_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/functions/valid_input.dart';
import '../home/profile/my_account/custom_text_field_profile.dart';

class StoryAdmin extends StatelessWidget {
  const StoryAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryAdminControllerImp>(builder: (controller) {
      return controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
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
                        controller: controller.content,
                        hintText: "Enter the content in english".tr,
                        labelText: "English Content".tr,
                        height: 10,
                        validator: (val) {
                          return vaildInput(val!, '');
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFieldProfile(
                        controller: controller.contentAr,
                        hintText: "Enter the content in arabic".tr,
                        labelText: "Arabic Content".tr,
                        height: 10,
                        validator: (val) {
                          return vaildInput(val!, '');
                        },
                      ),
                      const SizedBox(height: 20),
                      controller.isLoadingUpdate
                          ? const CircularProgressIndicator()
                          : ElevatedButton.icon(
                              onPressed: () {
                                controller.updateStory();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              icon: const Icon(Icons.replay_outlined),
                              label: Text("Update Story".tr),
                            ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
