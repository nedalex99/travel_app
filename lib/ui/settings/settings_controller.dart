import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/account_information/account_information_screen.dart';
import 'package:travel_app/ui/budget/budget_screen.dart';
import 'package:travel_app/ui/change_password/change_password_screen.dart';
import 'package:travel_app/ui/login/login_screen.dart';
import 'package:travel_app/ui/photo_album/components/photo_album_setting_screen.dart';
import 'package:travel_app/ui/upload_documents/upload_documents_screen.dart';

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

  void redirectDocumentsScreen() {
    Get.to(
      () => UploadDocumentsScreen(),
    );
  }

  void redirectTravelAlbumScreen() {
    Get.to(
      () => PhotoAlbumSettingsScreen(),
    );
  }

  void redirectBudgetScreen() {
    Get.to(
      () => BudgetScreen(),
    );
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut().then(
          (value) => Get.to(LoginScreen()),
        );
  }
}
