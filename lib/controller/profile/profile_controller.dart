import 'dart:io';

import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

abstract class ProfileController extends GetxController {
  goToMyAccount();
  goToMyCourses();
  changeName(String newName);
  changeImage(XFile? newImage);
}

class ProfileControllerImp extends ProfileController {
  late String userName;
  late String email;
  User user = FirebaseAuth.instance.currentUser!;
  final storage = FirebaseStorage.instance;
  XFile? image;
  late bool isLoading;

  @override
  Future<void> onInit() async {
    isLoading = true;
    update();

    userName = user.displayName!;
    email = user.email!;
    File? f = await _convertUrltoFile();
    if (f != null) {
      image = XFile(f.path);
    }

    isLoading = false;
    update();
    super.onInit();
  }

  Future<File?> _convertUrltoFile() async {
    ListResult list =
        await storage.ref("users_images").child(user.uid).listAll();
    if (list.items.isEmpty) {
      return null;
    }
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File("$tempPath/${list.items.first.name}");
    await storage
        .ref("users_images")
        .child(user.uid)
        .child(list.items.first.name)
        .writeToFile(file);
    return file;
  }

  @override
  goToMyAccount() {
    Get.toNamed(AppRouts.myAccountScreen);
  }

  @override
  goToMyCourses() {
    Get.toNamed(AppRouts.myCoursesScreen);
  }

  @override
  changeImage(XFile? newImage) {
    image = newImage;
    update();
  }

  @override
  changeName(String newName) {
    userName = newName;
    update();
  }
}
