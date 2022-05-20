import 'package:get/get.dart';

class CityWidgetController extends GetxController {
  RxBool isSelected = false.obs;
  RxList<String> cityList = <String>[].obs;

  void doCityList(String name) {
    if (isSelected.value) {
      cityList.add(name);
    }
  }
}
