import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/session_temp.dart';

class CityScreenController extends GetxController {
  RxList<String> cityList = <String>[].obs;

  void doCityList(String name) {
    cityList.add(name);
  }

  //Add City in Firebase
  Future<void> addCity({
    required RxList<String> cityList,
  }) {
    return FirebaseFirestore.instance
        .collection("selected-cities")
        .doc(userLoggedIn.uid)
        .set(
      {
        'city1': cityList[0],
        'city2': cityList[1],
        'city3': cityList[2],
      },
    );
  }
}
