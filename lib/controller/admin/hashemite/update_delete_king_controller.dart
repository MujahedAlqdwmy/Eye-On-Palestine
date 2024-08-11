import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/admin/hashemite/hashemite_admin_controller.dart';
import 'package:eye_on_palestine/data/models/hashemite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UpdateDeleteKingController extends GetxController {
  updateKing();
  deleteKing();
}

class UpdateDeleteKingControllerImp extends UpdateDeleteKingController {
  late HashemiteModel selectedKing;
  late TextEditingController nameOfKing;
  late TextEditingController nameOfKingAr;
  late TextEditingController imageUrl;
  late TextEditingController content;
  late TextEditingController contentAr;
  late TextEditingController order;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoadingUpade = false;
  bool isLoadingDelete = false;

  @override
  void onInit() {
    selectedKing = Get.arguments;
    nameOfKing = TextEditingController();
    nameOfKingAr = TextEditingController();
    imageUrl = TextEditingController();
    content = TextEditingController();
    contentAr = TextEditingController();
    order = TextEditingController();

    _fillTextField();
    super.onInit();
  }

  @override
  void dispose() {
    nameOfKing.dispose();
    nameOfKingAr.dispose();
    imageUrl.dispose();
    content.dispose();
    contentAr.dispose();
    order.dispose();
    super.dispose();
  }

  @override
  deleteKing() async {
    HashemiteAdminControllerImp controller = Get.find();
    isLoadingDelete = true;
    update();
    await db.collection('hashemite').doc(selectedKing.id).delete();
    controller.deleteKingFromList(selectedKing);
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
  }

  @override
  updateKing() async {
    if (formKey.currentState!.validate()) {
      HashemiteAdminControllerImp controller = Get.find();
      isLoadingUpade = true;
      update();
      await db.collection('hashemite').doc(selectedKing.id).update({
        'nameOfKing': nameOfKing.text.trim(),
        'nameOfKingAr': nameOfKingAr.text.trim(),
        'imageUrl': imageUrl.text.trim(),
        'content': content.text.trim(),
        'contentAr': contentAr.text.trim(),
        'order': double.parse(order.text.trim()),
      });
      HashemiteModel king = HashemiteModel(
        id: selectedKing.id,
        nameOfKing: nameOfKing.text.trim(),
        nameOfKingAr: nameOfKingAr.text.trim(),
        imageUrl: imageUrl.text.trim(),
        content: content.text.trim(),
        contentAr: contentAr.text.trim(),
        order: double.parse(order.text.trim()),
      );
      controller.updateKingFromList(king);
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    }
  }

  void _fillTextField() {
    nameOfKing.text = selectedKing.nameOfKing;
    nameOfKingAr.text = selectedKing.nameOfKingAr;
    imageUrl.text = selectedKing.imageUrl;
    content.text = selectedKing.content;
    contentAr.text = selectedKing.contentAr;
    order.text = selectedKing.order.toString();
  }
}
