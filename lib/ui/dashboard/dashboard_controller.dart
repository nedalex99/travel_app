import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/model/notification_data.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/model/user_data.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/enum.dart';
import 'package:travel_app/utils/constants/values.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/get_recommendation_response.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/recommendation_search.dart';
import 'package:travel_app/utils/session_temp.dart';
import 'package:travel_app/utils/util_functions.dart';

class DashboardController extends GetxController {
  DocumentSnapshot? documentSnapshot;
  final String cityOne;
  final String cityTwo;
  final String cityThree;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  RxString img = "".obs;
  Rx<UserData> userData =
      UserData(firstName: "", lastName: "", userName: "").obs;
  RxString cityRecommendation = "".obs;
  RxList<RecommendationModel> recommendationList = <RecommendationModel>[].obs;
  RxList<RecommendationModel> recommendationList2 = <RecommendationModel>[].obs;
  RxList<RecommendationModel> recommendationList3 = <RecommendationModel>[].obs;

  DashboardController({
    required this.cityOne,
    required this.cityTwo,
    required this.cityThree,
  });

  @override
  Future<void> onInit() async {
    getUserData();
    getImage();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getRecommendation();
    });
    await verifyInvite();
    super.onInit();
  }

  Future<void> verifyInvite() async {
    print("In verify");
    await FirebaseFirestore.instance
        .collection('invites')
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) async {
        List<String> invitedUsers = ((element.data() as Map)['invited'] as List)
            .map(
              (e) => e.toString(),
            )
            .toList();
        String invitedBy = (element.data() as Map)['invitedBy'];
        print("Invited users $invitedUsers");
        print("User logged in ${userLoggedIn.uid}");
        if (invitedUsers.contains(userLoggedIn.uid)) {
          print("Has invite");
          await FirebaseFirestore.instance
              .collection('invites')
              .doc(invitedBy)
              .update({
            'invited': FieldValue.arrayRemove(
              [
                userLoggedIn.uid,
              ],
            ),
          }).then(
            (value) => {
              showNotification(
                notificationData: NotificationData(
                  notificationType: NotificationType.SUCCESS,
                  title: 'Hey there,',
                  description: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Someone just invited you to join their trip.',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            },
          );
        }
      });
    });
  }

  //FIREBASE
  Future<void> getUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => {
              userData.value = UserData.fromJson(value),
            });
  }

  Future<void> getImage() async {
    await FirebaseStorage.instance
        .ref(uid)
        .child("images/$uid")
        .getDownloadURL()
        .then((value) => {
              img.value = value,
            });
  }

  //API RECOMM
  Future<void> getRecommendation() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    try {
      RecommendationSearch()
          .getRecommendationSearch(
        cityCode: handleIataCodes(cityOne),
      )
          .then((value) {
        if (value.statusCode == 200) {
          Get.back();
          recommendationList.value =
              (value as GetRecommendationResponse).recommendationModelList;
        } else {}
      });
    } catch (e) {}
  }

  Future<void> getRecommendationButton2() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    try {
      RecommendationSearch()
          .getRecommendationSearch(
        cityCode: handleIataCodes(cityTwo),
      )
          .then((value) {
        if (value.statusCode == 200) {
          Get.back();
          recommendationList.value =
              (value as GetRecommendationResponse).recommendationModelList;
        } else {}
      });
    } catch (e) {}
  }

  Future<void> getRecommendationButton3() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    try {
      RecommendationSearch()
          .getRecommendationSearch(
        cityCode: handleIataCodes(cityThree),
      )
          .then((value) {
        if (value.statusCode == 200) {
          Get.back();
          recommendationList.value =
              (value as GetRecommendationResponse).recommendationModelList;
        } else {}
      });
    } catch (e) {}
  }
}
