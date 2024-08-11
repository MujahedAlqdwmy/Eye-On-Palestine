import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/data/models/event_model.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_routs.dart';

abstract class EventsAdminController extends GetxController {
  goToAddEvents();
  goToUpdateOrDeleteEvent(EventModel selectedEvent);
  addEventToList(EventModel newEvent);
  deleteEventFromList(EventModel selectedEvent);
  updateEventFromList(EventModel newEvent);
}

class EventsAdminControllerImp extends EventsAdminController {
  bool isLoading = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<EventModel> events = [];

  @override
  void onInit() async {
    await _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    isLoading = true;
    update();
    final response = await db.collection('events').orderBy('date').get();
    if (response.docs.isNotEmpty) {
      for (var doc in response.docs) {
        EventModel e = EventModel(
          id: doc.id,
          date: doc.data()['date'],
          content: doc.data()['content'],
          contentAr: doc.data()['contentAr'],
          imageUrl: doc.data()['imageUrl'],
          areaOfIsrael: 0,
          areaOfPalestine: 0,
        );
        events.add(e);
      }
    }
    isLoading = false;
    update();
  }

  @override
  goToAddEvents() {
    Get.toNamed(AppRouts.addEventScreen);
  }

  @override
  goToUpdateOrDeleteEvent(EventModel selectedEvent) {
    Get.toNamed(AppRouts.updateDeleteEventScreen, arguments: selectedEvent);
  }

  @override
  addEventToList(EventModel newEvent) {
    events.add(newEvent);
    update();
  }

  @override
  deleteEventFromList(EventModel selectedEvent) {
    events.remove(selectedEvent);
    update();
  }

  @override
  updateEventFromList(EventModel newEvent) {
    events.removeWhere((e) => e.id == newEvent.id);
    events.add(newEvent);
    update();
  }
}
