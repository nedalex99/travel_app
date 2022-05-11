import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/model/user_data.dart';

class DashboardController extends GetxController {
  DocumentSnapshot? documentSnapshot;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  RxString img = "".obs;
  Rx<UserData> userData =
      UserData(firstName: "", lastName: "", userName: "").obs;

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


}
