import 'package:eye_on_palestine/controller/auth/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/auth/custom_text_button.dart';
import '../../widgets/auth/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) {
        return WillPopScope(
          onWillPop: () {
            controller.goToSignInPage();
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
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.height / 5),
                    Text(
                      "Eye on Palestine".tr,
                      style: const TextStyle(
                        fontSize: 35,
                        color: AppColor.white,
                      ),
                    ),
                    const SizedBox(height: 70),
                    Text(
                      "Please enter your email below to reset your password".tr,
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: controller.email,
                      hintText: "Email".tr,
                      validator: (val) {
                        return vaildInput(val!, "email");
                      },
                    ),
                    const SizedBox(height: 60),
                    controller.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            onPressed: () {
                              controller.checkEmail();
                            },
                            text: "Check Email".tr,
                          ),
                    CustomTextButton(
                      text: "Back to sign in".tr,
                      alignment: Alignment.center,
                      onPressed: () {
                        controller.goToSignInPage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
