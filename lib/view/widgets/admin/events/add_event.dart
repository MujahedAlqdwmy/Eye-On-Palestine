import 'package:eye_on_palestine/controller/admin/events/add_event_controller.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../home/profile/my_account/custom_text_field_profile.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEventControllerImp>(builder: (controller) {
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
                  controller: controller.date,
                  keyboardType: TextInputType.number,
                  hintText: "Enter the date of event".tr,
                  labelText: "date of event".tr,
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
                controller.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton.icon(
                        onPressed: () {
                          controller.addEvent();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: const Icon(Icons.add),
                        label: Text("Add Event".tr),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
