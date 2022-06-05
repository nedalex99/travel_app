import 'package:get/get.dart';
import 'package:travel_app/ui/account_information/account_information_screen.dart';

class SettingsController extends GetxController {


  void redirectAccountInformationScreen() {
    Get.to(
          () => AccountInformationScreen(),
    );
  }
}
