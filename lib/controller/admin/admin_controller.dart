import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:get/get.dart';

abstract class AdminController extends GetxController {}

class AdminControllerImp extends AdminController {
  List<String> boxes = [
    'Courses',
    'Events',
    'Hashemite',
    'The Story',
    'Feedbacks',
  ];

  List<Function> boxesFunction = [
    () {
      Get.toNamed(AppRouts.coursesAdminScreen);
    },
    () {
      Get.toNamed(AppRouts.eventsAdminScreen);
    },
    () {
      Get.toNamed(AppRouts.hashemiteAdminScreen);
    },
    () {
      Get.toNamed(AppRouts.storyAdminScreen);
    },
    () {
      Get.toNamed(AppRouts.feedBacksAdminScreen);
    },
  ];
}
