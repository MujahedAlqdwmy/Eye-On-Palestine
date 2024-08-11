import 'package:eye_on_palestine/controller/admin/courses/add_course_controller.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../home/profile/my_account/custom_text_field_profile.dart';

class AddCourse extends StatelessWidget {
  const AddCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCourseControllerImp>(builder: (controller) {
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
                controller.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton.icon(
                        onPressed: () {
                          controller.addCourse();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: const Icon(Icons.add),
                        label: Text("Add Course".tr),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
