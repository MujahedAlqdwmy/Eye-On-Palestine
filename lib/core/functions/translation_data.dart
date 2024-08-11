import 'package:eye_on_palestine/core/services/my_servises.dart';
import 'package:get/get.dart';

String translationData({required String en, required String ar}) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString('lang') == "ar") {
    return ar;
  } else {
    return en;
  }
}
