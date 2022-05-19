import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/model/user_data.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/get_recommendation_response.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/recommendation_search.dart';

class DashboardController extends GetxController {
  DocumentSnapshot? documentSnapshot;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  RxString img = "".obs;
  Rx<UserData> userData =
      UserData(firstName: "", lastName: "", userName: "").obs;
  RxString cityRecommendation = "".obs;

  @override
  void onInit() {
    getUserData();
    getImage();
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

  RxList<RecommendationModel> recommendationList = <RecommendationModel>[].obs;

  //API RECOMM
  Future<void> getRecommendation() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    try {
      RecommendationSearch()
          .getRecommendationSearch(
        cityCode: cityRecommendation.value,
      )
          .then((value) {
        Get.back();
        if (value.statusCode == 200) {
          recommendationList.value =
              (value as GetRecommendationResponse).recommendationModelList;
          print(recommendationList.toString());
        } else {
          print(value.statusCode!);
        }
      });
    } catch (e) {
      print("Erroar +${e.toString()}");
    }
  }
}
