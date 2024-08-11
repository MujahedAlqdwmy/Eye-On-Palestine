import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_button_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/app_colors.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(AppImages.noInternetLottie),
          const SizedBox(height: 20),
          Text(
            "No internet connection , please try again!".tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColor.textColorRed,
            ),
          ),
          const SizedBox(height: 20),
          CustomButtonSmall(
            text: 'Try again'.tr,
            onPressed: () {
              Get.offAllNamed(AppRouts.splashScreen);
            },
          ),
        ],
      ),
    );
  }
}
