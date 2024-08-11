import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import '../../widgets/auth/custom_button.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Successfull Sign Up".tr,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "msg success sign up".tr,
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
