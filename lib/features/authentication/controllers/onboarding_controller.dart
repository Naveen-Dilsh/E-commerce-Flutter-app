import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // variables

  // Update Current index when Page Scroll
  void updatePageIndicator(index) {}

  //jump to the specific dot selected page
  void dotNavigationClick(index) {}

  //update current Index & jump to next page
  void nextPage() {}

  //update current Index & jump to last page
  void skipPage() {}
}
