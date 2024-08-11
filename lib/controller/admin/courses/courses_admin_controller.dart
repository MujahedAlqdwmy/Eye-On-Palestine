import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/data/models/course_model.dart';
import 'package:get/get.dart';

import '../../../data/models/episode_model.dart';

abstract class CoursesAdminController extends GetxController {
  goToAddCourse();
  goToUpdateOrDeleteCourse(CourseModel selectedCourse);
  addCourseToList(CourseModel newCourse);
  deleteCourseFromList(CourseModel selectedCourse);
  updateCourseFromList(CourseModel newCourse);
  // addEpisodeToCourseList(
  //   CourseModel selectedCourse,
  //   EpisodeModel newEpisode,
  // );
  // deleteEpisodeFromCourseList(
  //   CourseModel selectedCourse,
  //   EpisodeModel selectedEpisode,
  // );
  // updateEpisodeFromCourseList(
  //   CourseModel selectedCourse,
  //   EpisodeModel selectedEpisode,
  // );
}

class CoursesAdminControllerImp extends CoursesAdminController {
  bool isLoading = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<CourseModel> courses = [];

  @override
  void onInit() async {
    await _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    isLoading = true;
    update();
    var respose = await db.collection("courses").get();
    for (var doc in respose.docs) {
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
        isFavorite: false,
      );
      courses.add(course);
    }
    isLoading = false;
    update();
  }

  @override
  goToAddCourse() {
    Get.toNamed(AppRouts.addCourseScreen);
  }

  @override
  goToUpdateOrDeleteCourse(CourseModel selectedCourse) {
    Get.toNamed(AppRouts.updateDeleteCourseScreen, arguments: selectedCourse);
  }

  @override
  addCourseToList(CourseModel newCourse) {
    courses.add(newCourse);
    update();
  }

  @override
  deleteCourseFromList(CourseModel selectedCourse) {
    courses.remove(selectedCourse);
    update();
  }

  @override
  updateCourseFromList(CourseModel newCourse) {
    int index = courses.indexWhere((c) => c.id == newCourse.id);
    courses[index] = newCourse;
    update();
  }

  // ====================== Edite Episode =================

  // @override
  // addEpisodeToCourseList(
  //   CourseModel selectedCourse,
  //   EpisodeModel newEpisode,
  // ) {
  //   courses
  //       .firstWhere((c) => c.id == selectedCourse.id)
  //       .episodes
  //       .add(newEpisode);
  //   update();
  // }

  // @override
  // deleteEpisodeFromCourseList(
  //   CourseModel selectedCourse,
  //   EpisodeModel selectedEpisode,
  // ) {
  //   courses
  //       .firstWhere((c) => c.id == selectedCourse.id)
  //       .episodes
  //       .remove(selectedEpisode);
  // }

  // @override
  // updateEpisodeFromCourseList(
  //   CourseModel selectedCourse,
  //   EpisodeModel selectedEpisode,
  // ) {
  //   final course = courses.firstWhere((c) => c.id == selectedCourse.id);
  //   int index = course.episodes.indexWhere((e) => e.id == selectedEpisode.id);
  //   course.episodes[index] = selectedEpisode;
  // }
}
