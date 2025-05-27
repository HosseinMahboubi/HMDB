import 'package:get/get.dart';

class NavigationController extends GetxController {
  /// -- CREATE A STATIC GETTER CALLED INSTANCE --
  static NavigationController get instance => Get.find();

  final Rx<int> selectedIndex = 0.obs;

  /// -- FUNCTION THAT CHANGES THE VALUE OF SELECTED INDEX --
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
