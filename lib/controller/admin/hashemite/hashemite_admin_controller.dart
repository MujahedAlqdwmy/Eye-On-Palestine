import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/data/models/hashemite_model.dart';
import 'package:get/get.dart';

abstract class HashemiteAdminController extends GetxController {
  goToAddKing();
  goToUpdateOrDeleteKing(HashemiteModel selectedKing);
  addKingFromList(HashemiteModel newKing);
  deleteKingFromList(HashemiteModel slectedKing);
  updateKingFromList(HashemiteModel newKing);
}

class HashemiteAdminControllerImp extends HashemiteAdminController {
  bool isLoading = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<HashemiteModel> achievements = [];

  @override
  void onInit() async {
    await _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    isLoading = true;
    update();
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
          order: doc.data()['order'],
        );
        achievements.add(h);
      }
    }
    isLoading = false;
    update();
  }

  @override
  goToAddKing() {
    Get.toNamed(AppRouts.addKingScreen);
  }

  @override
  goToUpdateOrDeleteKing(HashemiteModel selectedKing) {
    Get.toNamed(AppRouts.updateDeleteKingScreen, arguments: selectedKing);
  }

  @override
  addKingFromList(HashemiteModel newKing) {
    achievements.add(newKing);
    update();
  }

  @override
  deleteKingFromList(HashemiteModel slectedKing) {
    achievements.remove(slectedKing);
    update();
  }

  @override
  updateKingFromList(HashemiteModel newKing) {
    achievements.removeWhere((e) => e.id == newKing.id);
    achievements.add(newKing);
    update();
  }
}
