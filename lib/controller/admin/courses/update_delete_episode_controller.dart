import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/admin/courses/update_delete_course_controller.dart';
import 'package:eye_on_palestine/data/models/course_model.dart';
import 'package:eye_on_palestine/data/models/episode_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UpdateDeleteEpisodeController extends GetxController {
  updateEpisode();
  deleteEpisode();
}

class UpdateDeleteEpisodeControllerImp extends UpdateDeleteEpisodeController {
  late CourseModel selectedCourse;
  late TextEditingController url;
  late TextEditingController title;
  late TextEditingController titleAr;
  late TextEditingController description;
  late TextEditingController descriptionAr;
  late EpisodeModel selectedEpisode;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  UpdateDeleteCourseControllerImp controller = Get.find();
  bool isLoadingUpade = false;
  bool isLoadingDelete = false;

  @override
  void onInit() {
    selectedCourse = Get.arguments[0];
    selectedEpisode = Get.arguments[1];
    url = TextEditingController();
    title = TextEditingController();
    titleAr = TextEditingController();
    description = TextEditingController();
    descriptionAr = TextEditingController();
    _fillTextField();
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
  deleteEpisode() async {
    isLoadingDelete = true;
    update();

    await db
        .collection('courses')
        .doc(selectedCourse.id)
        .collection('episodes')
        .doc(selectedEpisode.id)
        .delete();

    final responseUser = await db.collection('users').get();
    for (var user in responseUser.docs) {
      await user.reference
          .collection('myCourses')
          .doc(selectedCourse.id)
          .collection('episodes')
          .doc(selectedEpisode.id)
          .delete();
    }

    controller.deleteEpisodeFromCourseList(selectedEpisode);
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
  }

  @override
  updateEpisode() async {
    if (formKey.currentState!.validate()) {
      isLoadingUpade = true;
      update();
      await db
          .collection('courses')
          .doc(selectedCourse.id)
          .collection('episodes')
          .doc(selectedEpisode.id)
          .update({
        'url': url.text.trim(),
        'description': description.text.trim(),
        'descriptionAr': descriptionAr.text.trim(),
        'title': title.text.trim(),
        'titleAr': titleAr.text.trim(),
      });
      EpisodeModel e = EpisodeModel(
        id: selectedEpisode.id,
        url: url.text.trim(),
        description: description.text.trim(),
        descriptionAr: descriptionAr.text.trim(),
        title: title.text.trim(),
        titleAr: titleAr.text.trim(),
        checkComplete: false,
      );

      final responseUser = await db.collection('users').get();
      for (var user in responseUser.docs) {
        await user.reference
            .collection('myCourses')
            .doc(selectedCourse.id)
            .collection('episodes')
            .doc(selectedEpisode.id)
            .update({
          'url': url.text.trim(),
          'description': description.text.trim(),
          'descriptionAr': descriptionAr.text.trim(),
          'title': title.text.trim(),
          'titleAr': titleAr.text.trim(),
        });
      }

      controller.updateEpisodeFromCourseList(e);
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    }
  }

  void _fillTextField() {
    url.text = selectedEpisode.url.toString();
    title.text = selectedEpisode.title;
    titleAr.text = selectedEpisode.titleAr;
    description.text = selectedEpisode.description;
    descriptionAr.text = selectedEpisode.descriptionAr;
  }
}
