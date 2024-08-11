import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/data/models/course_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../core/functions/snack_bar_show_msg.dart';
import '../../data/models/episode_model.dart';
import '../profile/my_courses_controller.dart';

abstract class CoursesController extends GetxController {
  goToCourse(CourseModel selectedCourse);
  incrementParticipants(String courseID);
  changeFavorite(String courseID);
  bool getFavoriteValue(String courseID);
  getCourseById(String courseId);
}

class CoursesControllerImp extends CoursesController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser!;
  bool isLoading = false;
  List<CourseModel> courses = [];

  @override
  goToCourse(CourseModel selectedCourse) {
    Get.toNamed(AppRouts.courseScreen, arguments: selectedCourse);
  }

  @override
  void onInit() async {
    await _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    isLoading = true;
    update();
    var resposeCourses = await db.collection("courses").get();
    var userData = await db.collection("users").doc(user.uid).get();
    for (var doc in resposeCourses.docs) {
      List<EpisodeModel> episodes = [];
      var resposeEpisodes = await db
          .collection("courses")
          .doc(doc.id)
          .collection("episodes")
          .get();
      for (var episode in resposeEpisodes.docs) {
        EpisodeModel e = EpisodeModel(
          id: episode.id,
          title: episode.data()["title"],
          titleAr: episode.data()["titleAr"],
          description: episode.data()["description"],
          descriptionAr: episode.data()["descriptionAr"],
          url: episode.data()["url"],
          checkComplete: episode.data()["checkComplete"],
        );
        episodes.add(e);
      }
      CourseModel course = CourseModel(
        id: doc.id,
        title: doc.data()['title'],
        titleAr: doc.data()['titleAr'],
        description: doc.data()['description'],
        descriptionAr: doc.data()['descriptionAr'],
        duration: doc.data()['duration'] + 0.0,
        numOfParticipants: (doc.data()['participants'] as List).length,
        numOfFavorites: (doc.data()['favorites'] as List).length,
        numOfEpisodes: episodes.length,
        episodes: episodes,
        isFavorite: ((userData.data()!['favorites']) as List).contains(doc.id),
      );
      courses.add(course);
    }
    isLoading = false;
    update();
  }

  @override
  incrementParticipants(String courseID) {
    final course = courses.firstWhere((c) => c.id == courseID);
    course.numOfParticipants++;
    update();
  }

  @override
  changeFavorite(String courseID) async {
    MyCoursesControllerImp controllerImp = Get.put(MyCoursesControllerImp());
    var course = courses.firstWhere((c) => c.id == courseID);
    if (course.isFavorite) {
      course.isFavorite = false;
      course.numOfFavorites--;
      controllerImp.deleteteFromMyFavorites(course);
      snackbarShowMsg('This course is deleted from your favorites');
      update();
      await db.collection('users').doc(user.uid).update({
        "favorites": FieldValue.arrayRemove([courseID])
      });
      await db.collection('courses').doc(courseID).update({
        "favorites": FieldValue.arrayRemove([user.uid]),
      });
    } else {
      course.isFavorite = true;
      course.numOfFavorites++;
      controllerImp.addToMyFavorites(course);
      snackbarShowMsg('This course is added to your favorites');
      update();
      await db.collection('users').doc(user.uid).update({
        "favorites": FieldValue.arrayUnion([courseID])
      });
      await db.collection('courses').doc(courseID).update({
        "favorites": FieldValue.arrayUnion([user.uid]),
      });
    }
  }

  @override
  bool getFavoriteValue(String courseID) {
    return courses.firstWhere((c) => c.id == courseID).isFavorite;
  }

  @override
  CourseModel getCourseById(String courseId) {
    return courses.firstWhere((c) => c.id == courseId);
  }
}
