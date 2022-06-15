import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/location_score_model.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/model/tours_and_activities_model.dart';
import 'package:travel_app/model/weather_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/network/amadeus_api/location_score_search/get_location_score_response.dart';
import 'package:travel_app/utils/network/amadeus_api/location_score_search/location_score_search.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:travel_app/utils/network/amadeus_api/travel_insights/get_tours_activities_response.dart';
import 'package:travel_app/utils/network/amadeus_api/travel_insights/tours_and_activities_search.dart';
import 'package:travel_app/utils/network/open_weather_api/get_weather_response.dart';
import 'package:travel_app/utils/network/open_weather_api/weather_search.dart';

class CityDetailsController extends GetxController {
  RecommendationModel recommendationModel;
  Rx<Weather> weather = Weather().obs;
  RxList<LocationScoreModel> locationScoreList = <LocationScoreModel>[].obs;
  RxList<ToursAndActivitiesModel> toursAndActivitiesList =
      <ToursAndActivitiesModel>[].obs;

  CityDetailsController({
    required this.recommendationModel,
  });

  @override
  void onInit() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getWeatherByCity();
      getLocationScore();
      getToursAndActivitiesByCity();
    });
    super.onInit();
  }

  Future<void> getLocationScore() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    print(recommendationModel.geoCode!.latitude!);
    print(recommendationModel.geoCode!.longitude!);
    await LocationScoreSearch()
        .getLocationScore(
      latitude: recommendationModel.geoCode!.latitude!,
      longitude: recommendationModel.geoCode!.longitude!,
    )
        .then(
      (value) {
        print(value.statusCode);
        if (value.statusCode == 200) {
          Get.back();
          locationScoreList.value = (value as GetLocationScoreResponse)
              .locationScoreModel
              .where((element) => element.radius == 200)
              .toList();
          print(value.statusCode);
        } else {
          Get.back();
          print("eroare1 ${value.statusCode}");
        }
      },
    );
  }

  Future<void> openLocation({
    required double latitude,
    required double longitude,
  }) async {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }

  Future<void> getToursAndActivitiesByCity() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    ToursAndActivitiesSearch()
        .getToursAndActivitiesByLocation(
          latitude: recommendationModel.geoCode!.latitude!,
          longitude: recommendationModel.geoCode!.longitude!,
          radius: 1,
        )
        .then(
          (value) => {
            Get.back(),
            if (value.statusCode == 200)
              {
                toursAndActivitiesList.value =
                    (value as GetToursActivitiesResponse).toursAndActivities,
                print(toursAndActivitiesList.length),
              },
          },
        );
  }

  Future<dynamic> getWeatherByCity() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    try {
      WeatherSearch()
          .getData(
            cityName: recommendationModel.name!,
          )
          .then((value) => {
                if (value.statusCode == 200)
                  {
                    Get.back(),
                    weather.value = (value as GetWeatherResponse).weather,
                    print(weather.value.city),
                    print(weather.value.temperature),
                  }
                else
                  {
                    print("eroare2 ${value.statusCode}"),
                  }
              });
    } catch (e) {
      print("Erroar +${e.toString()}");
    }
  }
}
