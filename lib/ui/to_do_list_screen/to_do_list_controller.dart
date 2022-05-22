import 'package:get/get.dart';

class ToDoListController extends GetxController {
  RxList toDos = [].obs;


  @override
  void onInit() {
    toDos.add("Item1");
    toDos.add("Item2");
    toDos.add("Item3");
    toDos.add("Item4");
    super.onInit();
  }
}
