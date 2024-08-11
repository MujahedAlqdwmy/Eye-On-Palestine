import 'package:eye_on_palestine/controller/admin/feedbacks_admin_controller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/view/widgets/admin/feedbacks/feedbacks_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBacksAdmin extends StatelessWidget {
  const FeedBacksAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          children: [
            Text(
              "You can show all of the feedbacks here".tr,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GetBuilder<FeedbacksAdminControllerImp>(
              builder: (controller) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: controller.feedbacks.length * 350,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.feedbacks.length,
                          itemBuilder: (ctx, index) {
                            return FeedBackCard(
                              username: controller.feedbacks[index].userName,
                              email: controller.feedbacks[index].email,
                              feedbacks: controller.feedbacks[index].feedbacks,
                            );
                          },
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
