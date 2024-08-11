import 'package:eye_on_palestine/controller/courses/courses_controller.dart';
import 'package:eye_on_palestine/controller/drawer_controller.dart';
import 'package:eye_on_palestine/controller/events_conroller.dart';
import 'package:eye_on_palestine/controller/feedback_controller.dart';
import 'package:eye_on_palestine/controller/hashemite/hashemite_controller.dart';
import 'package:eye_on_palestine/controller/location_controller.dart';
import 'package:eye_on_palestine/controller/profile/my_courses_controller.dart';
import 'package:eye_on_palestine/controller/profile/profile_controller.dart';
import 'package:eye_on_palestine/controller/story_controller.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/data/models/box_home.dart';
import 'package:eye_on_palestine/view/widgets/home/about_us/about_us.dart';
import 'package:eye_on_palestine/view/widgets/home/courses/courses.dart';
import 'package:eye_on_palestine/view/widgets/home/events/events.dart';
import 'package:eye_on_palestine/view/widgets/home/feedback.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/profile.dart';
import 'package:eye_on_palestine/view/widgets/home/story/story.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../view/widgets/home/hashmite/hashemite.dart';
import '../view/widgets/home/location/location.dart';
import 'package:stack/stack.dart' as stack;

import '../view/widgets/home/home/home.dart';

abstract class HomeController extends GetxController {
  changePage(int index);
  backPage();
  deleteDrawer(bool val);
  onRefresh();
}

class HomeControllerImp extends HomeController {
  late int currentIndex;
  late stack.Stack<int> pageStack;
  late User user;
  bool isDrawerOpen = false;

  List<String> iconListBottomBar = [
    AppImages.homeIcon,
    AppImages.coursesIcon,
    AppImages.locationIcon,
  ];

  List<String> textIconListBottomBar = [
    "Home",
    "Courses",
    "Location",
  ];

  List<Widget> page = [
    const Home(),
    const Courses(),
    const Location(),
    const Story(),
    const Events(),
    const Hashemite(),
    const Profile(),
    const AboutUs(),
    const FeedbackWidget(),
  ];

  List<String> pageName = [
    "Home",
    "Courses",
    "Location",
    "The Whole Story",
    "Events",
    "Hashemite",
    "My Profile",
    "About US",
    "Feedback",
  ];

  List<Function> deleteController = [
    () {}, //Home
    () {}, //Courses
    Get.delete<LocationControllerImp>,
    () {}, //story
    () {}, //Events
    () {}, //Hashmite,
    () {}, //Get.delete<ProfileControllerImp>,
    () {}, // about us
    Get.delete<FeedbackControllerImp>,
  ];

  List<BoxHomeData> boxes = [
    BoxHomeData(
      title: "The Story",
      image: AppImages.bigStarIcon,
    ),
    BoxHomeData(
      title: "Events",
      image: AppImages.bigCalenderIcon,
    ),
    BoxHomeData(
      title: "Hashemite",
      image: AppImages.bigCrownIcon,
    ),
  ];

  @override
  void onInit() async {
    currentIndex = 0;
    pageStack = stack.Stack();
    pageStack.push(currentIndex);
    user = FirebaseAuth.instance.currentUser!;
    Get.put(CoursesControllerImp());
    await Future.delayed(const Duration(seconds: 2));
    Get.put(MyCoursesControllerImp());
    Get.put(HashemiteControllerImp());
    Get.put(EventsControllerImp());
    Get.put(ProfileControllerImp());
    Get.put(DrawerControllerImp());
    Get.put(StoryControllerImp());
    super.onInit();
  }

  @override
  changePage(int index) {
    if (index == pageStack.top()) {
      return;
    }

    if (currentIndex == 4) {
      EventsControllerImp controllerImp = Get.find();
      controllerImp.currentEvent = null;
    }

    currentIndex = index;
    deleteController[pageStack.top()]();
    pageStack.push(currentIndex);
    update();
  }

  @override
  backPage() {
    if (isDrawerOpen) {
      Get.back();
      isDrawerOpen = false;
      return;
    }

    if (pageStack.size() == 1) {
      SystemNavigator.pop();
      return;
    }

    if (currentIndex == 4) {
      EventsControllerImp controllerImp = Get.find();
      controllerImp.currentEvent = null;
    }

    deleteController[pageStack.top()]();
    pageStack.pop();
    currentIndex = pageStack.top();
    update();
  }

  @override
  deleteDrawer(bool val) {
    isDrawerOpen = val;
    if (!val) {
      Get.delete<DrawerControllerImp>();
    }
  }

  @override
  onRefresh() async {
    Get.delete<CoursesControllerImp>();
    Get.delete<MyCoursesControllerImp>();
    Get.delete<HashemiteControllerImp>();
    Get.delete<EventsControllerImp>();
    Get.delete<ProfileControllerImp>();
    Get.delete<DrawerControllerImp>();
    Get.delete<StoryControllerImp>();
    Get.put(CoursesControllerImp());
    await Future.delayed(const Duration(seconds: 2));
    Get.put(MyCoursesControllerImp());
    Get.put(HashemiteControllerImp());
    Get.put(EventsControllerImp());
    Get.put(ProfileControllerImp());
    Get.put(DrawerControllerImp());
    Get.put(StoryControllerImp());
    await Future.delayed(const Duration(seconds: 2));
  }
}
