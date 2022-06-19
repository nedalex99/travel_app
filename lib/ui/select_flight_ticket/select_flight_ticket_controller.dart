import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/passenger_model.dart';
import 'package:travel_app/model/user_data.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/ui/create_trip/create_trip_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/firebase/firestore/find_users.dart';
import 'package:travel_app/utils/session_temp.dart';

class SelectFlightTicketController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController genderTextController = TextEditingController();
  TextEditingController dateBirthTextController = TextEditingController();

  TextEditingController friendUsername = TextEditingController();

  RxList<Passenger> passengers = <Passenger>[].obs;

  RxList<UserModel> usersFindByUsername = <UserModel>[].obs;

  RxBool openedTabIndex = false.obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  Future<void> getUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userLoggedIn.uid)
        .get()
        .then((value) {
      var userData = UserData.fromJson(value);
      passengers.add(
        Passenger(
          firstName: userData.firstName!,
          lastName: userData.lastName!,
          dateBirth: "aaa",
        ),
      );
    });
  }

  late Rx<UserModel> selectedUser = UserModel(
    userName: "",
    email: "",
    firstName: "",
    lastName: "",
  ).obs;

  void firstNameChanged(String value) {}

  void lastNameChanged(String value) {}

  void genderNameChanged(String value) {}

  void dateBirthNameChanged(String value) {}

  Future<void> friendUsernameChanged(String value) async {
    usersFindByUsername.clear();
    if (value.length > 2) {
      await FindUsers().findUsersByUsername(username: value).then(
            (value) => {
              print(value),
              value.docs.forEach((element) {
                print(element.data() as Map);
                UserModel userModel = UserModel.fromJson(element.data() as Map);
                print(userModel.uid!);
                usersFindByUsername.add(
                  UserModel.fromJson(
                    element.data() as Map,
                  ),
                );
              }),
              print(usersFindByUsername.length),
            },
          );
    } else {
      usersFindByUsername.clear();
    }
    print(usersFindByUsername.length);
  }

  void addPassenger() {
    passengers.add(
      Passenger(
        firstName: firstNameTextController.text,
        lastName: lastNameTextController.text,
        dateBirth: dateBirthTextController.text,
      ),
    );
    firstNameTextController.clear();
    lastNameTextController.clear();
    genderTextController.clear();
    dateBirthTextController.clear();
  }

  Future<void> addFlightTicket({
    required FlightCardDetails flightCardDetails,
  }) async {
    Get.back(
      result: passengers,
    );
    // Get.dialog(const LoadingDialog());
    // await FlightTicketsCollection()
    //     .addFlightTicket(
    //       flightTicket: FlightTicket(
    //         flightCardDetails: flightCardDetails,
    //         passengers: passengers,
    //       ),
    //     )
    //     .then(
    //       (value) => {
    //         Get.back(),
    //       },
    //     );
  }

  Future<void> sendInviteToUser({
    required String uid,
  }) async {
    Get.dialog(const LoadingDialog());
    await FindUsers().inviteUser(uid: uid).then(
      (value) {
        final CreateTripController createTripController = Get.find();
        createTripController.usersUid.add(uid);
        passengers.add(
          Passenger(
            firstName: selectedUser.value.firstName,
            lastName: selectedUser.value.lastName,
            dateBirth: "20.06.1999",
          ),
        );
        Get.back();
        Get.back();
      },
    );
  }

  void findFriend() {
    showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20.0,
          ),
          topRight: Radius.circular(
            20.0,
          ),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: Get.height * 0.75,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Find a friend',
                  style: kHeaderFieldTextStyle,
                ),
                InputField(
                  controller: InputFieldController(),
                  textCapitalization: TextCapitalization.characters,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: isValidName,
                  labelText: 'Find a friend',
                  onInputFieldChanged: (value) {},
                  textEditingController: friendUsername,
                  hasSufixIcon: true,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: usersFindByUsername.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            selectedUser.value = usersFindByUsername[index],
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  6.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: selectedUser.value.lastName == ""
                                        ? Colors.grey
                                        : Colors.red,
                                    blurRadius: 0.5,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(
                                8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: Colors.indigoAccent,
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        usersFindByUsername[index].firstName,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.date_range,
                                        color: Colors.indigoAccent,
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        usersFindByUsername[index].lastName,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onTap: () => sendInviteToUser(
                      uid: selectedUser.value.uid!,
                    ),
                    text: 'Send invite',
                    backgroundColor: kGeneralColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
