import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/admin/courses/update_delete_course_controller.dart';
import 'package:eye_on_palestine/data/models/course_model.dart';
import 'package:eye_on_palestine/data/models/episode_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddEpisodeController extends GetxController {
  addEpisode();
}

class AddEpisodeControllerImp extends AddEpisodeController {
  late CourseModel selectedCourse;
  late TextEditingController url;
  late TextEditingController title;
  late TextEditingController titleAr;
  late TextEditingController description;
  late TextEditingController descriptionAr;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  void onInit() {
    selectedCourse = Get.arguments;
    url = TextEditingController();
    title = TextEditingController();
    titleAr = TextEditingController();
    description = TextEditingController();
    descriptionAr = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    url.dispose();
    title.dispose();
    titleAr.dispose();
    description.dispose();
    descriptionAr.dispose();
    super.dispose();
  }

  @override
  addEpisode() async {
    if (formKey.currentState!.validate()) {
      UpdateDeleteCourseControllerImp controller = Get.find();
      isLoading = true;
      update();
      final doc = await db
          .collection('courses')
          .doc(selectedCourse.id)
          .collection('episodes')
          .add({
        'description': description.text.trim(),
        'descriptionAr': descriptionAr.text.trim(),
        'url': url.text.trim(),
        'title': title.text.trim(),
        'titleAr': titleAr.text.trim(),
        'checkComplete': false,
      });

      final responseUser = await db.collection("users").get();
      for (var user in responseUser.docs) {
        final responseMyCourses = await user.reference
            .collection('myCourses')
            .doc(selectedCourse.id)
            .get();
        if (responseMyCourses.exists) {
          await responseMyCourses.reference
              .collection('episodes')
              .doc(doc.id)
              .set({
            'description': description.text.trim(),
            'descriptionAr': descriptionAr.text.trim(),
            'url': url.text.trim(),
            'title': title.text.trim(),
            'titleAr': titleAr.text.trim(),
            'checkComplete': false,
          });
        }
      }
      EpisodeModel e = EpisodeModel(
        id: doc.id,
        description: description.text.trim(),
        descriptionAr: descriptionAr.text.trim(),
        url: url.text.trim(),
        title: title.text.trim(),
        titleAr: titleAr.text.trim(),
        checkComplete: false,
      );
      controller.addEpisodeToCourseList(e);
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    }
  }
}
