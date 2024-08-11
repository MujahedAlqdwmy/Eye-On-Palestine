import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/admin/courses/courses_admin_controller.dart';
import 'package:eye_on_palestine/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddCourseController extends GetxController {
  addCourse();
}

class AddCourseControllerImp extends AddCourseController {
  late TextEditingController duration;
  late TextEditingController title;
  late TextEditingController titleAr;
  late TextEditingController description;
  late TextEditingController descriptionAr;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  void onInit() {
    duration = TextEditingController();
    title = TextEditingController();
    titleAr = TextEditingController();
    description = TextEditingController();
    descriptionAr = TextEditingController();
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
  addCourse() async {
    if (formKey.currentState!.validate()) {
      CoursesAdminControllerImp controller = Get.find();
      isLoading = true;
      update();
      final doc = await db.collection('courses').add({
        'description': description.text.trim(),
        'descriptionAr': descriptionAr.text.trim(),
        'duration': double.parse(duration.text.trim()),
        'title': title.text.trim(),
        'titleAr': titleAr.text.trim(),
        'favorites': [],
        'participants': [],
      });
      CourseModel c = CourseModel(
        id: doc.id,
        description: description.text.trim(),
        descriptionAr: descriptionAr.text.trim(),
        duration: double.parse(duration.text.trim()),
        title: title.text.trim(),
        titleAr: titleAr.text.trim(),
        episodes: [],
        numOfEpisodes: 0,
        numOfFavorites: 0,
        numOfParticipants: 0,
        isFavorite: false,
      );
      controller.addCourseToList(c);
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    }
  }
}
