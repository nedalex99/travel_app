import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/model/user_data.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/values.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/get_recommendation_response.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/recommendation_search.dart';

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
  void onInit() {
    // getUserData();
    // getImage();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getRecommendation();
    });
    print(handleIataCodes(cityOne));
    print(handleIataCodes(cityTwo));
    print(handleIataCodes(cityThree));
    super.onInit();
  }

  //FIREBASE
  Future<void> getUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => {
              userData.value = UserData.fromJson(value),
              print(userData.value.userName),
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
    print(img.value);
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
          recommendationList.value =
              (value as GetRecommendationResponse).recommendationModelList;
          RecommendationSearch()
              .getRecommendationSearch(
            cityCode: handleIataCodes(cityTwo),
          )
              .then(
            (value) {
              if (value.statusCode == 200) {
                recommendationList2.value = (value as GetRecommendationResponse)
                    .recommendationModelList;
                RecommendationSearch()
                    .getRecommendationSearch(
                  cityCode: handleIataCodes(cityThree),
                )
                    .then(
                  (value) {
                    if (value.statusCode == 200) {
                      Get.back();
                      recommendationList3.value =
                          (value as GetRecommendationResponse)
                              .recommendationModelList;
                    }
                  },
                );
              }
            },
          );
        } else {
          print(value.statusCode!);
        }
      });
    } catch (e) {
      print("Erroar +${e.toString()}");
    }
  }
}
