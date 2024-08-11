import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

void snackbarChangePass(String email) {
  Get.snackbar(
    "",
    "",
    animationDuration: const Duration(milliseconds: 1500),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
    backgroundColor: AppColor.bgColor,
    titleText: Text(
      "${"We have sent reset email password to this email".tr} $email",
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
