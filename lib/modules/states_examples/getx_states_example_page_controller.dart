import 'package:get/get.dart';

class GetxStatesExamplePageController extends GetxController {
  final squareMode = 0.obs;

  void toggleMode() {
    if (squareMode.value == 0) {
      squareMode.value = 1;
    } else {
      squareMode.value = 0;
    }
  }
}