import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  goToSignInPage();
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  checkEmail() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      Get.offNamed(AppRouts.successForgetPassword);
    }
  }

  @override
  goToSignInPage() {
    Get.offNamed(AppRouts.signIn);
  }
}
