import 'package:get/get.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/ui/to_do_list_screen/components/add_to_do_screen.dart';

class ListPerTripController extends GetxController {
  RxList<ToDo> list = <ToDo>[].obs;

  @override
  void onInit() {
    //list.add(ToDo(title: "ceva"));
    super.onInit();
  }

  void redirectAddToDoScreen() {
    Get.to(
          () => AddToDoScreen(),
    );
  }


}
