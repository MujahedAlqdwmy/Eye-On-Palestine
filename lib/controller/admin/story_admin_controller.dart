import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class StoryAdminController extends GetxController {
  updateStory();
}

class StoryAdminControllerImp extends StoryAdminController {
  late TextEditingController content;
  late TextEditingController contentAr;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;
  bool isLoadingUpdate = false;
  bool isFound = false;
  String? docId;

  @override
  void onInit() async {
    content = TextEditingController();
    contentAr = TextEditingController();
    isLoading = true;
    update();
    final response = await db.collection('story').get();
    if (response.docs.isNotEmpty) {
      content.text = response.docs[0].data()['wholeStory'];
      contentAr.text = response.docs[0].data()['wholeStoryAr'];
      docId = response.docs[0].id;
      isFound = true;
    }
    isLoading = false;
    update();
    super.onInit();
  }

  @override
  void dispose() {
    content.dispose();
    contentAr.dispose();
    super.dispose();
  }

  @override
  updateStory() async {
    isLoadingUpdate = true;
    update();
    if (isFound) {
      await db.collection('story').doc(docId).update({
        "wholeStory": content.text,
        "wholeStoryAr": contentAr.text,
      });
    } else {
      await db.collection('story').add({
        "wholeStory": content.text,
        "wholeStoryAr": contentAr.text,
      });
    }
    Get.back();
  }
}
