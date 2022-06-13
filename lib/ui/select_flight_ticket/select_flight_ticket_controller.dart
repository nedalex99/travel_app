import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/passenger_model.dart';
import 'package:travel_app/model/user_data.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
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

  void friendUsernameChanged(String value) {
    usersFindByUsername.clear();
    if (value.length > 2) {
      FindUsers().findUsersByUsername(username: value).then(
            (value) => {
              value.docs.forEach((element) {
                UserModel userModel = UserModel.fromJson(element.data() as Map);
                print(userModel.uid!);
                usersFindByUsername.add(
                  UserModel.fromJson(
                    element.data() as Map,
                  ),
                );
              }),
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
    await FindUsers().inviteUser(uid: uid).then(
          (value) => {},
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
                  textCapitalization: TextCapitalization.characters,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: isValidName,
                  labelText: 'Find a friend',
                  onInputFieldChanged: friendUsernameChanged,
                  textEditingController: friendUsername,
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
                        child: Container(
                          padding: const EdgeInsets.all(
                            8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            borderRadius: BorderRadius.circular(
                              6.0,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  usersFindByUsername[index].firstName,
                                ),
                                Text(
                                  usersFindByUsername[index].lastName,
                                ),
                              ],
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
