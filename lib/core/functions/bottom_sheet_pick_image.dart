import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

Future<void> bottomSheetPickImage({
  required Function()? onTapLibrary,
  required Function()? onTapCamera,
}) async {
  return await Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onTapLibrary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.photo_library,
                  color: AppColor.textColorRed,
                  size: 35,
                ),
                const SizedBox(height: 4),
                Text(
                  "Library".tr,
                  style: const TextStyle(
                    color: AppColor.textColorRed,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          GestureDetector(
            onTap: onTapCamera,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColor.textColorRed,
                  size: 35,
                ),
                const SizedBox(height: 4),
                Text(
                  "Camera".tr,
                  style: const TextStyle(
                    color: AppColor.textColorRed,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
