import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eye_on_palestine/controller/auth/sign_up_controller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:eye_on_palestine/view/widgets/auth/custom_line_bottom_auth.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/auth/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignUpControllerImp>(builder: (controller) {
        return Container(
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
                  CustomTextField(
                    controller: controller.username,
                    hintText: "User Name".tr,
                    validator: (val) {
                      return vaildInput(val!, "userName");
                    },
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    controller: controller.email,
                    hintText: "Email".tr,
                    validator: (val) {
                      return vaildInput(val!, "email");
                    },
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    controller: controller.password,
                    hintText: "Password".tr,
                    validator: (val) {
                      return vaildInput(val!, "password");
                    },
                    obscureText: controller.isHidPass,
                    suffixIcon: IconButton(
                      icon: Icon(controller.isHidPass
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        controller.toggleShowPassword();
                      },
                    ),
                  ),
                  const SizedBox(height: 60),
                  controller.isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          onPressed: () {
                            controller.signUp();
                          },
                          text: "Sign Up".tr,
                        ),
                  const SizedBox(height: 25),
                  CustomLineBottomAuth(
                    text1: "Already have an account ?".tr,
                    text2: "Sign in".tr,
                    onPressed: () {
                      controller.goToSignInPage();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
