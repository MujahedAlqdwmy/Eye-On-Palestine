import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/data/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EventsController extends GetxController {
  changeEvent(EventModel event);
  backToUp();
  getData();
}

class EventsControllerImp extends EventsController {
  List<EventModel> events = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;
  EventModel? currentEvent;
  late ScrollController scrollController;

  @override
  changeEvent(EventModel event) {
    currentEvent = event;
    scrollController.animateTo(
      Get.height,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
    );
    update();
  }

  @override
  backToUp() async {
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
    );
    await Future.delayed(const Duration(seconds: 1));
    currentEvent = null;
    update();
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  getData() async {
    isLoading = true;
    update();
    var respose = await db.collection("events").orderBy("date").get();
    for (var doc in respose.docs) {
      EventModel event = EventModel(
        id: doc.id,
        content: doc.data()["content"],
        contentAr: doc.data()["contentAr"],
        date: doc.data()["date"],
        areaOfIsrael: doc.data()["areaOfIsrael"] + 0.0,
        areaOfPalestine: doc.data()["areaOfPalestine"] + 0.0,
        imageUrl: doc.data()["imageUrl"],
      );
      events.add(event);
    }

    isLoading = false;
    update();
  }
}
