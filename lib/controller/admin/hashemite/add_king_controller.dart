import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/admin/hashemite/hashemite_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/hashemite_model.dart';

abstract class AddKingController extends GetxController {
  addKing();
}

class AddKingControllerImp extends AddKingController {
  late TextEditingController nameOfKing;
  late TextEditingController nameOfKingAr;
  late TextEditingController imageUrl;
  late TextEditingController content;
  late TextEditingController contentAr;
  late TextEditingController order;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  void onInit() {
    nameOfKing = TextEditingController();
    nameOfKingAr = TextEditingController();
    imageUrl = TextEditingController();
    content = TextEditingController();
    contentAr = TextEditingController();
    order = TextEditingController();
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
  addKing() async {
    if (formKey.currentState!.validate()) {
      HashemiteAdminControllerImp controller = Get.find();
      isLoading = true;
      update();
      final doc = await db.collection('hashemite').add({
        'nameOfKing': nameOfKing.text.trim(),
        'nameOfKingAr': nameOfKingAr.text.trim(),
        'imageUrl': imageUrl.text.trim(),
        'content': content.text.trim(),
        'contentAr': contentAr.text.trim(),
        'order': double.parse(order.text.trim()),
      });
      HashemiteModel h = HashemiteModel(
        id: doc.id,
        nameOfKing: nameOfKing.text.trim(),
        nameOfKingAr: nameOfKingAr.text.trim(),
        content: content.text.trim(),
        contentAr: contentAr.text.trim(),
        imageUrl: imageUrl.text.trim(),
        order: double.parse(order.text.trim()),
      );
      controller.addKingFromList(h);
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    }
  }
}
