import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/profile/profile_controller.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/functions/bottom_sheet_pick_image.dart';
import '../../core/functions/dialog_delete_account.dart';
import '../../core/functions/snack_bar_change_pass.dart';
import '../../core/functions/snack_bar_show_msg.dart';
import '../../core/services/my_servises.dart';
import '../drawer_controller.dart';

abstract class MyAccountController extends GetxController {
  changePassword();

  updateAccount();

  changeImage();

  deleteAccount();
}

class MyAccountControllerImp extends MyAccountController {
  late TextEditingController userName;
  late TextEditingController email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser!;
  final storage = FirebaseStorage.instance;
  MyServices myServices = Get.find();
  bool isLoading = false;
  bool isLoadingChangePass = false;
  bool isLoadingDelete = false;
  XFile? image;

  @override
  void onInit() {
    ProfileControllerImp profileController = Get.find();
    userName = TextEditingController();
    userName.text = profileController.userName;
    email = TextEditingController();
    email.text = profileController.email;
    image = profileController.image;
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  changeImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? photo;
    await bottomSheetPickImage(onTapCamera: () async {
      photo = await picker.pickImage(source: ImageSource.camera);
      Get.back();
    }, onTapLibrary: () async {
      photo = await picker.pickImage(source: ImageSource.gallery);
      Get.back();
    });
    if (photo != null) {
      image = photo;
    }
    update();
  }

  @override
  changePassword() async {
    isLoadingChangePass = true;
    update();
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email.text.trim());
    isLoadingChangePass = false;
    update();
    snackbarChangePass(email.text);
  }

  @override
  updateAccount() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();

      await _updateUserData(userName.text.trim());
      ProfileControllerImp controllerImp = Get.find();
      DrawerControllerImp controllerDrawer = Get.put(DrawerControllerImp());
      controllerImp.changeName(userName.text.trim());
      controllerImp.changeImage(image);
      controllerDrawer.changeName();
      controllerDrawer.changeImage();
      snackbarShowMsg('The account has been updated successfully');
      Get.offAllNamed(AppRouts.homeScreen);
    }
  }

  @override
  deleteAccount() {
    dialogDeleteAccount(
      user,
      () async {
        isLoadingDelete = true;
        update();

        // delete user data from fire store
        await db.collection('users').doc(user.uid).delete();

        final responseMyCourse = await db
            .collection('users')
            .doc(user.uid)
            .collection('myCourses')
            .get();
        if (responseMyCourse.docs.isNotEmpty) {
          for (var doc in responseMyCourse.docs) {
            final responseEpisodes = await db
                .collection('users')
                .doc(user.uid)
                .collection('myCourses')
                .doc(doc.id)
                .collection('episodes')
                .get();
            if (responseEpisodes.docs.isNotEmpty) {
              for (var e in responseEpisodes.docs) {
                await e.reference.delete();
              }
            }
            await doc.reference.delete();
          }
        }

        final responseFavorites = await db
            .collection('courses')
            .where('favorites', arrayContains: user.uid)
            .get();
        for (var doc in responseFavorites.docs) {
          await doc.reference.update({
            "favorites": FieldValue.arrayRemove([user.uid])
          });
        }

        final responseParticipants = await db
            .collection('courses')
            .where('participants', arrayContains: user.uid)
            .get();
        for (var doc in responseParticipants.docs) {
          await doc.reference.update({
            "participants": FieldValue.arrayRemove([user.uid])
          });
        }
        // delete user data from fire store

        // delete user data from fire storge
        ListResult list =
            await storage.ref("users_images").child(user.uid).listAll();
        if (list.items.isNotEmpty) {
          await storage
              .ref("users_images")
              .child(user.uid)
              .child(list.items.first.name)
              .delete();
        }
        final responseFeedback =
            await db.collection('feedbacks').doc(user.uid).get();
        if (responseFeedback.exists) {
          await db.collection('feedbacks').doc(user.uid).delete();
        }
        // delete user data from fire storge

        myServices.sharedPreferences.remove('Login');

        // delete user
        await user.delete();
        Get.offAllNamed(AppRouts.signIn);
      },
    );
  }

  Future<void> _updateUserData(String username) async {
    String? url = await _uploadImage();
    var userData = {
      "username": username,
      'imageUrl': url,
    };
    await user.updateDisplayName(username);
    if (url != null) {
      await user.updatePhotoURL(url);
    }
    await db.collection("users").doc(user.uid).update(userData);

    final responseFeedback =
        await db.collection('feedbacks').doc(user.uid).get();
    if (responseFeedback.exists) {
      await db.collection('feedbacks').doc(user.uid).update({
        'username': username,
      });
    }
  }

  Future<String?> _uploadImage() async {
    if (image == null) {
      return null;
    }

    // if the user have image , we must delete it
    ListResult list =
        await storage.ref("users_images").child(user.uid).listAll();
    if (list.items.isNotEmpty) {
      await storage
          .ref("users_images")
          .child(user.uid)
          .child(list.items.first.name)
          .delete();
    }
    // if the user have image , we must delete it

    File file = File(image!.path);
    Reference ref =
        storage.ref('users_images').child(user.uid).child(image!.name);
    await ref.putFile(file);
    String url = await ref.getDownloadURL();
    return url;
  }
}
