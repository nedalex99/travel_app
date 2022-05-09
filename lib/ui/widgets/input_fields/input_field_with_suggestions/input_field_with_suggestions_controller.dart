import 'package:get/get.dart';
import 'package:travel_app/ui/create_trip/create_trip_controller.dart';

class InputFieldWithSuggestionsController extends GetxController {
  Rx<String> errorText = "".obs;
  final CreateTripController tripController = Get.find();

  void validateAirport({
    required String text,
  }) {
    try {
      var airport = tripController.airportsList
          .firstWhere((element) => element.name == text);
      errorText.value = "";
    } catch (e) {
      errorText.value = "Invalid airport";
    }
  }
}
