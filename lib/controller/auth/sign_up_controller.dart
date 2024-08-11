import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/snack_bar_show_error.dart';

abstract class SignUpController extends GetxController {
  signUp();
  toggleShowPassword();
  goToSignInPage();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHidPass = true;

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToSignInPage() {
    Get.offNamed(AppRouts.signIn);
  }

  @override
  signUp() async {
    if (formKey.currentState!.validate()) {
      // start sign up
      try {
        isLoading = true;
        update();
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        await addUserData(
          username.text.trim(),
          email.text.trim(),
        );
        Get.offNamed(AppRouts.successSignUp);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          snackbarShowError('The account already exists for that email.');
          isLoading = false;
          update();
        }
      } catch (e) {
        snackbarShowError('Something error , try again later');
        isLoading = false;
        update();
      }
      // end sign up
    }
  }

  Future<void> addUserData(String username, String email) async {
    var user = {
      "username": username,
      'email': email,
      'imageUrl': '',
      'favorites': [],
      'role': 'user',
    };
    await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
    await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(user);
  }

  @override
  toggleShowPassword() {
    isHidPass = !isHidPass;
    update();
  }
}
