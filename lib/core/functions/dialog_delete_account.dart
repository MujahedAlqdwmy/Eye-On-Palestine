import 'package:eye_on_palestine/controller/profile/my_account_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/home/custom_button_small.dart';

void dialogDeleteAccount(User user, Function()? onPressed) {
  Get.defaultDialog(
    title: "Are you sure to delete your account".tr,
    titleStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    content: GetBuilder<MyAccountControllerImp>(builder: (controller) {
      return controller.isLoadingDelete
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonSmall(
                      width: 100,
                      onPressed: onPressed,
                      text: "Yes".tr,
                    ),
                    const SizedBox(width: 10),
                    CustomButtonSmall(
                      width: 100,
                      onPressed: () async {
                        Get.back();
                      },
                      text: "No".tr,
                    ),
                  ],
                ),
                const SizedBox(height: 7),
              ],
            );
    }),
  );
}
