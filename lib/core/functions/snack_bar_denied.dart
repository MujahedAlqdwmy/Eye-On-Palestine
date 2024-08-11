import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

void snackBarDenied() {
  Get.snackbar(
    "",
    "",
    animationDuration: const Duration(seconds: 1),
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    snackPosition: SnackPosition.BOTTOM,
    maxWidth: 400,
    margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
    messageText: Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.white,
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: AppColor.white,
              width: 2,
            ),
          ),
        ),
        onPressed: () async {
          await Geolocator.openAppSettings();
        },
        icon: const Icon(Icons.settings_outlined),
        label: Text("Open your settings".tr),
      ),
    ),
    backgroundColor: AppColor.bgColor,
    titleText: Text(
      "You must allow the application \nto access your location".tr,
      style: const TextStyle(
        color: AppColor.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        height: 1.7,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundGradient: const LinearGradient(
      colors: [
        AppColor.gradientColor1,
        AppColor.gradientColor2,
      ],
    ),
  );
}
