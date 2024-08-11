import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/hashemite/add_king_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../home/profile/my_account/custom_text_field_profile.dart';

class AddKing extends StatelessWidget {
  const AddKing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddKingControllerImp>(builder: (controller) {
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
                  controller: controller.nameOfKing,
                  hintText: "Enter the title of achievement in english".tr,
                  labelText: "Title of achievement in english".tr,
                  validator: (val) {
                    return vaildInput(val!, '');
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFieldProfile(
                  controller: controller.nameOfKingAr,
                  hintText: "Enter the title of achievement in arabic".tr,
                  labelText: "Title of achievement in arabic".tr,
                  validator: (val) {
                    return vaildInput(val!, '');
                  },
                ),
                const SizedBox(height: 20),
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
                CustomTextFieldProfile(
                  controller: controller.imageUrl,
                  hintText: "Enter the image url".tr,
                  labelText: "Image url".tr,
                  validator: (val) {
                    return vaildInput(val!, 'url');
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFieldProfile(
                  controller: controller.order,
                  hintText: "Enter the order of achievement".tr,
                  labelText: "Achievement Order".tr,
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
                          controller.addKing();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: const Icon(Icons.add),
                        label: Text("Add Achievement".tr),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
