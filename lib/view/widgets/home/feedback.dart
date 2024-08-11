import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_button_small.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_text_field_feedback.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_title_body_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/feedback_controller.dart';

class FeedbackWidget extends GetView<FeedbackControllerImp> {
  const FeedbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FeedbackControllerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Center(
        child: Column(
          children: [
            CustomTitleAndBodySection(
              title: "Feedback".tr,
              body: 'introduction feedback screen'.tr,
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppImages.feedBackBox),
                ),
                color: AppColor.white,
                borderRadius: BorderRadius.circular(11),
              ),
              width: 283,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Form(
                    key: controller.formKey,
                    child: CustomTextFieldFeedback(
                      validator: (val) {
                        return vaildInput(val!, 'message');
                      },
                      controller: controller.message,
                      hintText: "Enter Here".tr,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GetBuilder<FeedbackControllerImp>(builder: (_) {
                    return controller.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButtonSmall(
                            text: "Submit".tr,
                            onPressed: () {
                              controller.submit();
                            },
                          );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
