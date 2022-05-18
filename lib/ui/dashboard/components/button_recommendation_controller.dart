import 'package:get/get.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/get_recommendation_response.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/recommendation_search.dart';

class ButtonRecommendationController extends GetxController {
  RxBool isSelected = true.obs;
  RxString cityRecommendation = "".obs;

  //late RecommendationModel citiesRecommendations;
  //late RecommendationModel countryRecommendations;
  Rx<RecommendationModel> recommendationList = RecommendationModel().obs;

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
        print(value);
        if (value.statusCode == 200) {
          recommendationList.value =
              (value as GetRecommendationResponse).recommendationModel;
        } else {
          print(value.statusCode!);
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
