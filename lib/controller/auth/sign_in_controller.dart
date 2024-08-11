import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/core/services/my_servises.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/snack_bar_show_error.dart';

abstract class SignInController extends GetxController {
  signIn();
  toggleShowPassword();
  goToSignUpPage();
  goToForgetPassord();
}

class SignInControllerImp extends SignInController {
  late TextEditingController email;
  late TextEditingController password;
  bool isLoading = false;

  MyServices myServices = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isHidPass = true;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  signIn() async {
    if (formKey.currentState!.validate()) {
      UserCredential user;
      //start sign in
      try {
        isLoading = true;
        update();
        user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        if (user.user!.emailVerified) {
          final doc = await db.collection('users').doc(user.user!.uid).get();
          if (doc.data()!['role'] == 'user') {
            myServices.sharedPreferences.setString('Login', 'user');
            Get.offAllNamed(AppRouts.homeScreen);
          } else {
            myServices.sharedPreferences.setString('Login', 'admin');
            Get.offAllNamed(AppRouts.adminScreen);
          }
        } else {
          await user.user!.sendEmailVerification();
          snackbarShowError(
              'You must verify your email , go to your email to verify it');
          isLoading = false;
          update();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          snackbarShowError('No user found for that email.');
          isLoading = false;
          update();
        } else if (e.code == 'wrong-password') {
          snackbarShowError('Wrong password provided for that user.');
          isLoading = false;
          update();
        }
      }
      // end sing in
    }
  }

  @override
  toggleShowPassword() {
    isHidPass = !isHidPass;
    update();
  }

  @override
  goToSignUpPage() {
    Get.offNamed(AppRouts.signUp);
  }

  @override
  goToForgetPassord() {
    Get.offNamed(AppRouts.forgetPassword);
  }
}
