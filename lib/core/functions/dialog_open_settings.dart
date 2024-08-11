import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../view/widgets/home/custom_button_small.dart';

void dialogOpenSettings() {
  Get.defaultDialog(
    title: "You must turn on\n your location".tr,
    titleStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.symmetric(vertical: 15),
    content: Column(
      children: [
        CustomButtonSmall(
          onPressed: () async {
            await Geolocator.openLocationSettings();
            Get.back();
          },
          text: "Open Settings".tr,
        ),
        const SizedBox(height: 7),
      ],
    ),
  );
}
