import 'package:eye_on_palestine/data/models/hashemite_model.dart';
import 'package:get/get.dart';

abstract class HashemiteKingController extends GetxController {}

class HashemiteKingControllerImp extends HashemiteKingController {
  late HashemiteModel selectedAchievement;

  @override
  void onInit() {
    selectedAchievement = Get.arguments;
    super.onInit();
  }
}
