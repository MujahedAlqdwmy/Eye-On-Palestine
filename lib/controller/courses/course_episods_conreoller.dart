import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/courses/courses_controller.dart';
import 'package:eye_on_palestine/controller/profile/my_courses_controller.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/data/models/episode_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../data/models/course_model.dart';

abstract class CourseEpisodsController extends GetxController {
  goToEpisode(EpisodeModel selectedEpisode);
  whenEndEpisode(EpisodeModel selectedEpisode);
}

class CourseEpisodsControllerImp extends CourseEpisodsController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser!;
  late CourseModel selectedCourse;
  late String selectedCourseId;
  late List<EpisodeModel> episodes;
  bool isLoading = false;

  @override
  void onInit() async {
    CoursesControllerImp controllerImp = Get.find();
    selectedCourseId = Get.arguments;
    selectedCourse = controllerImp.getCourseById(selectedCourseId);
    episodes = [];
    isLoading = true;
    update();

    await _getEpisode();
    isLoading = false;
    update();
    super.onInit();
  }

  @override
  goToEpisode(EpisodeModel selectedEpisode) {
    Get.toNamed(AppRouts.episodeScreen, arguments: selectedEpisode);
  }

  Future<void> _getEpisode() async {
    final collection = await db
        .collection("users")
        .doc(user.uid)
        .collection('myCourses')
        .doc(selectedCourse.id)
        .collection('episodes')
        .get();
    for (var doc in collection.docs) {
      EpisodeModel e = EpisodeModel(
        id: doc.id,
        title: doc.data()["title"],
        titleAr: doc.data()["titleAr"],
        description: doc.data()["description"],
        descriptionAr: doc.data()["descriptionAr"],
        url: doc.data()["url"],
        checkComplete: doc.data()["checkComplete"],
      );
      episodes.add(e);
    }
  }

  @override
  whenEndEpisode(EpisodeModel selectedEpisode) async {
    MyCoursesControllerImp myCoursesControllerImp = Get.find();
    myCoursesControllerImp.incrementNumOfCompletes(selectedCourseId);
    selectedEpisode.checkComplete = true;
    await db
        .collection("users")
        .doc(user.uid)
        .collection('myCourses')
        .doc(selectedCourse.id)
        .collection('episodes')
        .doc(selectedEpisode.id)
        .update({"checkComplete": true});
    update();
  }
}
