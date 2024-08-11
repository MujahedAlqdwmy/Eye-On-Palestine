import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/profile/my_courses_controller.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/data/models/course_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:get/get.dart';

import '../../core/functions/snack_bar_show_msg.dart';
import 'courses_controller.dart';

abstract class CourseController extends GetxController {
  addCourse();
  goToCourse();
}

class CourseControllerImp extends CourseController {
  late CourseModel selectedCourse;
  FirebaseFirestore db = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser!;
  bool isLoading = false;
  late YoutubePlayerController youtubePlayerController;
  bool checkHasCourse = false;

  @override
  void onInit() async {
    selectedCourse = Get.arguments;

    String? videoId =
        YoutubePlayerController.convertUrlToId(selectedCourse.episodes[0].url);

    youtubePlayerController = YoutubePlayerController.fromVideoId(
      videoId: videoId!,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );

    await _checkHasCourse();

    super.onInit();
  }

  @override
  addCourse() async {
    CoursesControllerImp controllerImp = Get.find();
    MyCoursesControllerImp coursesControllerImp = Get.find();
    isLoading = true;
    update();

    await db
        .collection("users")
        .doc(user.uid)
        .collection('myCourses')
        .doc(selectedCourse.id)
        .set({
      "title": selectedCourse.title,
      "titleAr": selectedCourse.titleAr,
    });

    for (var ep in selectedCourse.episodes) {
      await db
          .collection("users")
          .doc(user.uid)
          .collection('myCourses')
          .doc(selectedCourse.id)
          .collection('episodes')
          .doc(ep.id)
          .set({
        "checkComplete": ep.checkComplete,
        "description": ep.description,
        "descriptionAr": ep.descriptionAr,
        "title": ep.title,
        "titleAr": ep.titleAr,
        "url": ep.url,
      });
    }

    await db.collection("courses").doc(selectedCourse.id).update({
      "participants": FieldValue.arrayUnion([user.uid])
    });

    snackbarShowMsg('This course is added to your course');
    controllerImp.incrementParticipants(selectedCourse.id);
    coursesControllerImp.addToMyCourse(selectedCourse);
    checkHasCourse = true;

    isLoading = false;
    update();
  }

  Future<void> _checkHasCourse() async {
    isLoading = true;
    update();
    final doc = await db
        .collection("users")
        .doc(user.uid)
        .collection('myCourses')
        .doc(selectedCourse.id)
        .get();

    if (doc.exists) {
      checkHasCourse = true;
    } else {
      checkHasCourse = false;
    }

    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    update();
  }

  @override
  goToCourse() {
    Get.offNamed(AppRouts.courseEpisodsScreen, arguments: selectedCourse.id);
  }
}
