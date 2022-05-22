
import 'package:get/get.dart';

class CityScreenController extends GetxController {
  RxList<String> cityList = <String>[].obs;

  void doCityList(String name) {
      cityList.add(name);
  }

}
