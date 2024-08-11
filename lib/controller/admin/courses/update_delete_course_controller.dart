import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/admin/courses/courses_admin_controller.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/episode_model.dart';

abstract class UpdateDeleteCourseController extends GetxController {
  updateCourse();
  deleteCourse();
  goToUpdateDeleteEpisode(EpisodeModel selectedEpisode);
  goToAddEpisode();
  addEpisodeToCourseList(EpisodeModel newEpisode);
  deleteEpisodeFromCourseList(EpisodeModel selectedEpisode);
  updateEpisodeFromCourseList(EpisodeModel selectedEpisode);
}

class UpdateDeleteCourseControllerImp extends UpdateDeleteCourseController {
  late CourseModel selectedCourse;
  late List<EpisodeModel> episodes;
  late TextEditingController duration;
  late TextEditingController title;
  late TextEditingController titleAr;
  late TextEditingController description;
  late TextEditingController descriptionAr;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  CoursesAdminControllerImp controller = Get.find();
  bool isLoadingUpade = false;
  bool isLoadingDelete = false;

  @override
  void onInit() {
    selectedCourse = Get.arguments;
    duration = TextEditingController();
    title = TextEditingController();
    titleAr = TextEditingController();
    description = TextEditingController();
    descriptionAr = TextEditingController();
    episodes = selectedCourse.episodes;
    _fillTextField();
    super.onInit();
  }

  @override
  void dispose() {
    duration.dispose();
    title.dispose();
    titleAr.dispose();
    description.dispose();
    descriptionAr.dispose();
    super.dispose();
  }

  @override
  deleteCourse() async {
    isLoadingDelete = true;
    update();

    await db.collection('courses').doc(selectedCourse.id).delete();

    final responseEpisodes = await db
        .collection('courses')
        .doc(selectedCourse.id)
        .collection('episodes')
        .get();
    for (var doc in responseEpisodes.docs) {
      await doc.reference.delete();
    }

    final responseUser = await db.collection('users').get();
    for (var user in responseUser.docs) {
      await user.reference
          .collection('myCourses')
          .doc(selectedCourse.id)
          .delete();
      final responseEpisodes = await user.reference
          .collection('myCourses')
          .doc(selectedCourse.id)
          .collection('episodes')
          .get();
      for (var e in responseEpisodes.docs) {
        await e.reference.delete();
      }

      await user.reference.update({
        'favorites': FieldValue.arrayRemove([selectedCourse.id])
      });
    }

    controller.deleteCourseFromList(selectedCourse);
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
  }

  @override
  updateCourse() async {
    if (formKey.currentState!.validate()) {
      isLoadingUpade = true;
      update();
      await db.collection('courses').doc(selectedCourse.id).update({
        'duration': double.parse(duration.text.trim()),
        'description': description.text.trim(),
        'descriptionAr': descriptionAr.text.trim(),
        'title': title.text.trim(),
        'titleAr': titleAr.text.trim(),
      });
      CourseModel c = CourseModel(
        id: selectedCourse.id,
        duration: double.parse(duration.text.trim()),
        description: description.text.trim(),
        descriptionAr: descriptionAr.text.trim(),
        title: title.text.trim(),
        titleAr: titleAr.text.trim(),
        episodes: selectedCourse.episodes,
        numOfEpisodes: selectedCourse.numOfEpisodes,
        numOfFavorites: selectedCourse.numOfFavorites,
        numOfParticipants: selectedCourse.numOfParticipants,
        isFavorite: selectedCourse.isFavorite,
      );
      controller.updateCourseFromList(c);
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    }
  }

  void _fillTextField() {
    duration.text = selectedCourse.duration.toString();
    title.text = selectedCourse.title;
    titleAr.text = selectedCourse.titleAr;
    description.text = selectedCourse.description;
    descriptionAr.text = selectedCourse.descriptionAr;
  }

  // ========================= Edit Episode ======================

  @override
  goToAddEpisode() {
    Get.toNamed(AppRouts.addEpisodeScreen, arguments: selectedCourse);
  }

  @override
  goToUpdateDeleteEpisode(EpisodeModel selectedEpisode) {
    Get.toNamed(AppRouts.updateDeleteEpisodeScreen, arguments: [
      selectedCourse,
      selectedEpisode,
    ]);
  }

  @override
  addEpisodeToCourseList(EpisodeModel newEpisode) {
    episodes.add(newEpisode);
    update();
  }

  @override
  deleteEpisodeFromCourseList(EpisodeModel selectedEpisode) {
    episodes.remove(selectedEpisode);
    update();
  }

  @override
  updateEpisodeFromCourseList(EpisodeModel selectedEpisode) {
    int index = episodes.indexWhere((e) => e.id == selectedEpisode.id);
    episodes[index] = selectedEpisode;
    update();
  }
}
