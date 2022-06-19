import 'package:get/get.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/ui/select_flight_ticket/select_flight_ticket_controller.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/network/firebase/firestore/find_users.dart';

class InputFieldController extends GetxController {
  RxBool isVisible = true.obs;

  Future<void> friendUsernameChanged(String value) async {
    final SelectFlightTicketController controller = Get.find();
    controller.usersFindByUsername.clear();
    controller.selectedUser.value.lastName = "";
    if (value.length > 2) {
      Get.dialog(const LoadingDialog());
      await FindUsers().findUsersByUsername(username: value).then(
            (value) => {
              value.docs.forEach((element) {
                controller.usersFindByUsername.add(
                  UserModel.fromJson(
                    element.data() as Map,
                  ),
                );
              }),
              Get.back(),
            },
          );
    } else {
      controller.selectedUser.value.lastName = "";
      controller.usersFindByUsername.clear();
    }
  }
}
