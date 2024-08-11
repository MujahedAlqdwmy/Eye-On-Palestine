import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_on_palestine/data/models/feedbacks_model.dart';
import 'package:get/get.dart';

abstract class FeedbacksAdminController extends GetxController {}

class FeedbacksAdminControllerImp extends FeedbacksAdminController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;
  List<FeedbacksModel> feedbacks = [];

  @override
  void onInit() async {
    await _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    isLoading = true;
    update();
    final response = await db.collection('feedbacks').get();
    if (response.docs.isNotEmpty) {
      for (var doc in response.docs) {
        FeedbacksModel f = FeedbacksModel(
          userName: doc.data()['username'],
          email: doc.data()['email'],
          feedbacks: doc.data()['feedbacks'],
        );
        feedbacks.add(f);
      }
    }
    isLoading = false;
    update();
  }
}
