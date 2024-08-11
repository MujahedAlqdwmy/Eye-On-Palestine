import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:eye_on_palestine/view/widgets/auth/custom_line_bottom_auth.dart';
import '../../../controller/auth/sign_in_controller.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/auth/custom_text_button.dart';
import '../../widgets/auth/custom_text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInControllerImp>(builder: (controller) {
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
                      return vaildInput(val!, "");
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
                  CustomTextButton(
                    text: "Forgot password ?".tr,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      controller.goToForgetPassord();
                    },
                  ),
                  const SizedBox(height: 60),
                  controller.isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          onPressed: () {
                            controller.signIn();
                          },
                          text: "Sign in".tr,
                        ),
                  const SizedBox(height: 25),
                  CustomLineBottomAuth(
                    text1: "Don’t have an account ?".tr,
                    text2: "Sign Up".tr,
                    onPressed: () {
                      controller.goToSignUpPage();
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
