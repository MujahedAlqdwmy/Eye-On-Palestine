import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import '../../widgets/auth/custom_button.dart';

class SuccessForgetPassword extends StatelessWidget {
  const SuccessForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          Get.offAllNamed(AppRouts.signIn);
          return Future.value(true);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Eye on Palestine".tr,
                style: const TextStyle(
                  fontSize: 35,
                  color: AppColor.white,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "msg success forget password".tr,
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 13,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              CustomButton(
                onPressed: () {
                  Get.offAllNamed(AppRouts.signIn);
                },
                text: "Go to sign in".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
