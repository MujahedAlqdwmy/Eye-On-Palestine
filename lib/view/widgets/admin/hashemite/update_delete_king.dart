import 'package:eye_on_palestine/controller/admin/hashemite/update_delete_king_controller.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../home/profile/my_account/custom_text_field_profile.dart';

class UpdateDeleteKing extends StatelessWidget {
  const UpdateDeleteKing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateDeleteKingControllerImp>(builder: (controller) {
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
                  "You can update it Or delete it :".tr,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.isLoadingUpade
                        ? const CircularProgressIndicator()
                        : ElevatedButton.icon(
                            onPressed: () {
                              controller.updateKing();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            icon: const Icon(Icons.replay_outlined),
                            label: Text("Update Achievement".tr),
                          ),
                    const SizedBox(width: 10),
                    controller.isLoadingDelete
                        ? const CircularProgressIndicator()
                        : ElevatedButton.icon(
                            onPressed: () {
                              controller.deleteKing();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            icon: const Icon(Icons.delete),
                            label: Text("Delete Achievement".tr),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
