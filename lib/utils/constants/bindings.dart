import 'package:get/get.dart';
import 'package:travel_app/ui/login/login_controller.dart';

class DataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
