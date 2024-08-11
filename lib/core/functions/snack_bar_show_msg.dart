import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

void snackbarShowMsg(String msg) {
  Get.closeCurrentSnackbar();
  Get.snackbar(
    "",
    "",
    duration: const Duration(milliseconds: 2000),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
    backgroundColor: AppColor.bgColor,
    titleText: Text(
      msg.tr,
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
