import 'package:eye_on_palestine/controller/hashemite/hashemite_controller.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/hashmite/hashemite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_title_body_section.dart';

class Hashemite extends StatelessWidget {
  const Hashemite({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(),
            CustomTitleAndBodySection(
              title: "Hashemite".tr,
              body: "introduction Hashemite screen".tr,
            ),
            Image.asset(
              AppImages.hashemitePic,
              scale: 1.2,
            ),
            const SizedBox(height: 10),
            GetBuilder<HashemiteControllerImp>(
              builder: (controller) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: controller.achievements.length * 135,
                        width: 300,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.achievements.length,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.goToAchievement(
                                    controller.achievements[index]);
                              },
                              child: HashemiteCard(
                                nameOfKing: translationData(
                                  en: controller.achievements[index].nameOfKing,
                                  ar: controller
                                      .achievements[index].nameOfKingAr,
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
