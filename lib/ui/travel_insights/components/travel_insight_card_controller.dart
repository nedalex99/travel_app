import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';

class TravelInsightCardController extends GetxController {
  RxBool textShowMoreFlag = false.obs;

  Future<void> openLocation({
    required double latitude,
    required double longitude,
  }) async {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }
}
