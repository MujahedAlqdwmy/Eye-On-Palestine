import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/admin/events/events_admin_controller.dart';
import 'package:eye_on_palestine/data/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddEventController extends GetxController {
  addEvent();
}

class AddEventControllerImp extends AddEventController {
  late TextEditingController date;
  late TextEditingController imageUrl;
  late TextEditingController content;
  late TextEditingController contentAr;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  void onInit() {
    date = TextEditingController();
    imageUrl = TextEditingController();
    content = TextEditingController();
    contentAr = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    date.dispose();
    imageUrl.dispose();
    content.dispose();
    contentAr.dispose();
    super.dispose();
  }

  @override
  addEvent() async {
    if (formKey.currentState!.validate()) {
      EventsAdminControllerImp controller = Get.find();
      isLoading = true;
      update();
      final doc = await db.collection('events').add({
        'date': date.text.trim(),
        'imageUrl': imageUrl.text.trim(),
        'content': content.text.trim(),
        'contentAr': contentAr.text.trim(),
        'areaOfIsrael': 0,
        'areaOfPalestine': 0,
      });
      EventModel e = EventModel(
        id: doc.id,
        date: date.text.trim(),
        content: content.text.trim(),
        contentAr: contentAr.text.trim(),
        imageUrl: imageUrl.text.trim(),
        areaOfIsrael: 0,
        areaOfPalestine: 0,
      );
      controller.addEventToList(e);
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    }
  }
}
