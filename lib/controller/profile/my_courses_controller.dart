import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/data/models/course_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../data/models/my_course_model.dart';
import '../courses/courses_controller.dart';

abstract class MyCoursesController extends GetxController {
  goToCourse(String courseId);

  incrementNumOfCompletes(String courseId);

  addToMyCourse(CourseModel selectedCourse);

  addToMyFavorites(CourseModel selectedCourse);

  deleteteFromMyFavorites(CourseModel selectedCourse);
}

class MyCoursesControllerImp extends MyCoursesController {
  CoursesControllerImp c = Get.find();
  late List<MyCourseModel> myCourses = [];
  late List<MyCourseModel> completedCourses = [];
  late List<CourseModel> myFavorites = [];
  User user = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  void onInit() async {
    await _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    isLoading = true;
    update();

    final responseMyCourses = await db
        .collection("users")
        .doc(user.uid)
        .collection('myCourses')
        .get();

    if (responseMyCourses.docs.isNotEmpty) {
      for (var course in responseMyCourses.docs) {
        int numOfEpisodes = 0;
        int numOfCompletes = 0;

        final responseEpisodes =
            await course.reference.collection('episodes').get();
        if (responseEpisodes.docs.isNotEmpty) {
          numOfEpisodes = responseEpisodes.docs.length;
        }

        final responseEpisodesComplete = await course.reference
            .collection('episodes')
            .where('checkComplete', isEqualTo: true)
            .get();

        if (responseEpisodesComplete.docs.isNotEmpty) {
          numOfCompletes = responseEpisodesComplete.docs.length;
        }

        MyCourseModel c = MyCourseModel(
          id: course.id,
          title: course.data()['title'],
          titleAr: course.data()['titleAr'],
          numOfComplete: numOfCompletes,
          numOfEpisodes: numOfEpisodes,
        );
        myCourses.add(c);
      }
    }

    // initialize completedCourses
    completedCourses = myCourses
        .where((coures) => coures.numOfComplete == coures.numOfEpisodes)
        .toList();

    // initialize my favorites
    CoursesControllerImp controllerImp = Get.find();
    final respnseUser = await db.collection("users").doc(user.uid).get();
    for (var id in respnseUser.data()!['favorites']) {
      var course = controllerImp.getCourseById(id);
      myFavorites.add(course);
    }

    isLoading = false;
    update();
  }

  @override
  goToCourse(String courseId) {
    CoursesControllerImp controllerImp = Get.put(CoursesControllerImp());
    final selectedCourse = controllerImp.getCourseById(courseId);
    Get.toNamed(AppRouts.courseScreen, arguments: selectedCourse);
  }

  @override
  incrementNumOfCompletes(String courseId) {
    final course = myCourses.firstWhere((c) => c.id == courseId);
    course.numOfComplete++;
    if (course.numOfComplete == course.numOfEpisodes) {
      completedCourses.add(course);
    }
    update();
  }

  @override
  addToMyCourse(CourseModel selectedCourse) {
    MyCourseModel c = MyCourseModel(
      id: selectedCourse.id,
      title: selectedCourse.title,
      titleAr: selectedCourse.titleAr,
      numOfComplete: 0,
      numOfEpisodes: selectedCourse.numOfEpisodes,
    );
    myCourses.add(c);
    update();
  }

  @override
  addToMyFavorites(CourseModel selectedCourse) {
    myFavorites.add(selectedCourse);
    update();
  }

  @override
  deleteteFromMyFavorites(CourseModel selectedCourse) {
    myFavorites.removeWhere((c) => c.id == selectedCourse.id);
    update();
  }
}
