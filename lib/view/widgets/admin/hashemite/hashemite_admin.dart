import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_button_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/hashemite/hashemite_admin_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../home/hashmite/hashemite_card.dart';

class HashemiteAdmin extends GetView<HashemiteAdminControllerImp> {
  const HashemiteAdmin({super.key});

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
              'Upper text hashemite admin'.tr,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GetBuilder<HashemiteAdminControllerImp>(
              builder: (controller) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: controller.achievements.length * 150,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.achievements.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.goToUpdateOrDeleteKing(
                                  controller.achievements[index],
                                );
                              },
                              child: HashemiteCard(
                                  nameOfKing: translationData(
                                en: controller.achievements[index].nameOfKing,
                                ar: controller.achievements[index].nameOfKingAr,
                              )),
                            );
                          },
                        ),
                      );
              },
            ),
            const SizedBox(height: 20),
            CustomButtonSmall(
              text: "Add new one".tr,
              onPressed: () {
                controller.goToAddKing();
              },
            ),
          ],
        ),
      ),
    );
  }
}
