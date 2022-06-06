import 'package:get/get.dart';
import 'package:travel_app/ui/account_information/account_information_screen.dart';
import 'package:travel_app/ui/change_password/change_password_screen.dart';

class SettingsController extends GetxController {
  void redirectAccountInformationScreen() {
    Get.to(
      () => AccountInformationScreen(),
    );
  }

  void redirectChangePasswordScreen() {
    Get.to(
      () => ChangePasswordScreen(),
    );
  }
}
