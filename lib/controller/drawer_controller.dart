import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../core/constants/app_routs.dart';
import '../core/services/my_servises.dart';

abstract class DrawerController extends GetxController {
  // changeMode();
  logout();
  changeImage();
  changeName();
}

class DrawerControllerImp extends DrawerController {
  //bool isDarkmode = false;
  MyServices myServices = Get.find();
  late String name;
  late String? imageUrl;

  // @override
  // changeMode() {
  //   isDarkmode = !isDarkmode;
  //   update();
  // }

  @override
  void onInit() {
    name = FirebaseAuth.instance.currentUser!.displayName!;
    imageUrl = FirebaseAuth.instance.currentUser!.photoURL == null
        ? null
        : FirebaseAuth.instance.currentUser!.photoURL!;
    super.onInit();
  }

  @override
  logout() async {
    await FirebaseAuth.instance.signOut();
    myServices.sharedPreferences.remove('Login');
    Get.offAllNamed(AppRouts.signIn);
  }

  @override
  changeImage() {
    imageUrl = FirebaseAuth.instance.currentUser!.photoURL == null
        ? null
        : FirebaseAuth.instance.currentUser!.photoURL!;
    update();
  }

  @override
  changeName() {
    name = FirebaseAuth.instance.currentUser!.displayName!;
    update();
  }
}
