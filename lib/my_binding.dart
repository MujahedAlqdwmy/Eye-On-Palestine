import 'package:eye_on_palestine/controller/auth/forget_password_controller.dart';
import 'package:eye_on_palestine/controller/auth/sign_in_controller.dart';
import 'package:eye_on_palestine/controller/auth/sign_up_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => SignInControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
  }
}
