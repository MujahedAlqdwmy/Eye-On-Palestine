import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/core/services/my_servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInMeddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('Login') != null &&
        myServices.sharedPreferences.getString('Login') == 'user') {
      return const RouteSettings(name: AppRouts.homeScreen);
    } else if (myServices.sharedPreferences.getString('Login') != null &&
        myServices.sharedPreferences.getString('Login') == 'admin') {
      return const RouteSettings(name: AppRouts.adminScreen);
    }
    return super.redirect(route);
  }
}
