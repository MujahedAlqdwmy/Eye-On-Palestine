import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

abstract class StoryController extends GetxController {}

class StoryControllerImp extends StoryController {
  late String story;
  late String storyAr;
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  void onInit() async {
    isLoading = true;
    update();
    final response = await db.collection("story").get();
    story = response.docs[0].data()['wholeStory'];
    storyAr = response.docs[0].data()['wholeStoryAr'];
    isLoading = false;
    update();
    super.onInit();
  }
}
