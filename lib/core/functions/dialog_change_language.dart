import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/home/custom_button_small.dart';
import '../localization/locale_controller.dart';

void dialogChangeLanguage(LocaleController controller) {
  Get.defaultDialog(
    title: "Choose Language:".tr,
    titleStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.symmetric(vertical: 15),
    content: Column(
      children: [
        CustomButtonSmall(
          onPressed: () {
            controller.changeLanguage('ar');
            Get.back();
          },
          text: "Arabic".tr,
        ),
        const SizedBox(height: 7),
        CustomButtonSmall(
          onPressed: () {
            controller.changeLanguage('en');
            Get.back();
          },
          text: "English".tr,
        ),
        const SizedBox(height: 7),
      ],
    ),
  );
}
