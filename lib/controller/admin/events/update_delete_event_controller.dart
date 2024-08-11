import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/controller/admin/events/events_admin_controller.dart';
import 'package:eye_on_palestine/data/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UpdateDeleteEventController extends GetxController {
  updateEvent();
  deleteEvent();
}

class UpdateDeleteEventControllerImp extends UpdateDeleteEventController {
  late EventModel selectedEvent;
  late TextEditingController date;
  late TextEditingController imageUrl;
  late TextEditingController content;
  late TextEditingController contentAr;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoadingUpade = false;
  bool isLoadingDelete = false;

  @override
  void onInit() {
    selectedEvent = Get.arguments;
    date = TextEditingController();
    imageUrl = TextEditingController();
    content = TextEditingController();
    contentAr = TextEditingController();
    _fillTextField();
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
  deleteEvent() async {
    EventsAdminControllerImp controller = Get.find();
    isLoadingDelete = true;
    update();
    await db.collection('events').doc(selectedEvent.id).delete();
    controller.deleteEventFromList(selectedEvent);
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
  }

  @override
  updateEvent() async {
    if (formKey.currentState!.validate()) {
      EventsAdminControllerImp controller = Get.find();
      isLoadingUpade = true;
      update();
      await db.collection('events').doc(selectedEvent.id).update({
        'date': date.text.trim(),
        'imageUrl': imageUrl.text.trim(),
        'content': content.text.trim(),
        'contentAr': contentAr.text.trim(),
      });
      EventModel e = EventModel(
        id: selectedEvent.id,
        date: date.text.trim(),
        imageUrl: imageUrl.text.trim(),
        content: content.text.trim(),
        contentAr: contentAr.text.trim(),
        areaOfIsrael: 0.0,
        areaOfPalestine: 0.0,
      );
      controller.updateEventFromList(e);
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    }
  }

  void _fillTextField() {
    date.text = selectedEvent.date;
    imageUrl.text = selectedEvent.imageUrl;
    content.text = selectedEvent.content;
    contentAr.text = selectedEvent.contentAr;
  }
}
