import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/data/models/hashemite_model.dart';
import 'package:get/get.dart';

abstract class HashemiteController extends GetxController {
  goToAchievement(HashemiteModel selectedAchievement);
}

class HashemiteControllerImp extends HashemiteController {
  bool isLoading = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<HashemiteModel> achievements = [];

  @override
  goToAchievement(HashemiteModel selectedAchievement) {
    Get.toNamed(AppRouts.hashemiteKingScreen, arguments: selectedAchievement);
  }

  @override
  void onInit() async {
    await _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    final response = await db.collection('hashemite').orderBy('order').get();
    if (response.docs.isNotEmpty) {
      for (var doc in response.docs) {
        HashemiteModel h = HashemiteModel(
          id: doc.id,
          nameOfKing: doc.data()['nameOfKing'],
          nameOfKingAr: doc.data()['nameOfKingAr'],
          imageUrl: doc.data()['imageUrl'],
          content: doc.data()['content'],
          contentAr: doc.data()['contentAr'],
        );
        achievements.add(h);
      }
    }
  }
}
