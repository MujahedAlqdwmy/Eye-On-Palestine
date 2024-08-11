import 'package:eye_on_palestine/core/services/my_servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  void changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? langCode = myServices.sharedPreferences.getString("lang");
    if (langCode != null) {
      language = Locale(langCode);
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      myServices.sharedPreferences.setString("lang", language!.languageCode);
    }
    super.onInit();
  }
}
