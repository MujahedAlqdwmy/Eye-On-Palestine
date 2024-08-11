import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/snack_bar_show_msg.dart';

abstract class FeedbackController extends GetxController {
  submit();
}

class FeedbackControllerImp extends FeedbackController {
  late TextEditingController message;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  User user = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  void onInit() {
    message = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  @override
  submit() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      DocumentSnapshot doc =
          await db.collection('feedbacks').doc(user.uid).get();
      if (!doc.exists) {
        await db.collection('feedbacks').doc(user.uid).set({
          'username': user.displayName,
          'email': user.email,
          'feedbacks': FieldValue.arrayUnion([message.text.trim()]),
        });
      } else {
        await db.collection('feedbacks').doc(user.uid).update({
          'feedbacks': FieldValue.arrayUnion([message.text.trim()]),
        });
      }
      snackbarShowMsg('The feedback has been sent successfully');
      Get.offAllNamed(AppRouts.homeScreen);
    }
  }
}
