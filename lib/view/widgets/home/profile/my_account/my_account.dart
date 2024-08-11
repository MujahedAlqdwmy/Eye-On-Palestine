import 'package:eye_on_palestine/controller/profile/my_account_controller.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/valid_input.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/circle_image.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/my_account/custom_button_account.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/my_account/custom_text_field_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<MyAccountControllerImp>(builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: Get.height / 20),
                GestureDetector(
                  onTap: () {
                    controller.changeImage();
                  },
                  child: Stack(
                    children: [
                      CircleImage(image: controller.image),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SvgPicture.asset(AppImages.cameraIcon),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextFieldProfile(
                  hintText: "Please enter your user name".tr,
                  labelText: "User Name".tr,
                  controller: controller.userName,
                  suffixIcon: const Icon(Icons.edit),
                  validator: (val) {
                    return vaildInput(val!, "username");
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFieldProfile(
                  hintText: "Please enter your email".tr,
                  labelText: "Email".tr,
                  controller: controller.email,
                  enabled: false,
                  validator: (val) {
                    return vaildInput(val!, "email");
                  },
                ),
                const SizedBox(height: 15),
                controller.isLoadingChangePass
                    ? const CircularProgressIndicator()
                    : CustomButtonAccount(
                        icon: Icons.lock_outline,
                        onPressed: () {
                          controller.changePassword();
                        },
                        text: "Change Password".tr,
                      ),
                const SizedBox(height: 50),
                controller.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButtonAccount(
                        icon: Icons.save_alt_rounded,
                        onPressed: () {
                          controller.updateAccount();
                        },
                        text: "Save".tr,
                      ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    controller.deleteAccount();
                  },
                  icon: const Icon(Icons.delete),
                  label: Text("Delete account".tr),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
