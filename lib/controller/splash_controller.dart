import 'package:eye_on_palestine/controller/home_controller.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/core/functions/check_internet.dart';
import 'package:eye_on_palestine/core/services/my_servises.dart';
import 'package:get/get.dart';

abstract class SplashController extends GetxController {}

class SplashControllerImp extends SplashController {
  final MyServices _myServices = Get.find();

  @override
  void onInit() async {
    bool result = await checkInternet();
    if (!result) {
      Get.offAllNamed(AppRouts.noInternetScreen);
    } else {
      // if(!_getUser()){
      //   return;
      // }
      if (_myServices.sharedPreferences.getString('Login') != null &&
          _myServices.sharedPreferences.getString('Login') == 'user') {
        Get.put(HomeControllerImp());
      }
      await Future.delayed(const Duration(seconds: 6));
      Get.offAllNamed(AppRouts.signIn);
      super.onInit();
    }
  }

// bool _getUser() {
//   bool value = false;
//   FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     if (user == null) {
//       value = false;
//       if (_myServices.sharedPreferences.getString('Login') != null) {}
//       _myServices.sharedPreferences.remove('Login');
//       Get.offAllNamed(AppRouts.signIn);
//     } else {
//       value = true;
//     }
//   });
//   return value;
// }
}
