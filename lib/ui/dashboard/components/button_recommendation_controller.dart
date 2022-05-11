import 'dart:convert';

import 'package:get/get.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/recommendation_search.dart';

class ButtonRecommendationController extends GetxController {
  RxBool isSelected = true.obs;
  RxString cityRecommendation = "".obs;

  //late RecommendationModel citiesRecommendations;
  //late RecommendationModel countryRecommendations;
  List<RecommendationModel> recommendationList = [];

  //API RECOMM
  Future<void> getRecommendation() async {
    try {
      RecommendationSearch()
          .getRecommendationSearch(
            cityCode: cityRecommendation.value,
          )
          .then((value) => {
                print(value),
              });
    } catch (e) {}
  }
}
