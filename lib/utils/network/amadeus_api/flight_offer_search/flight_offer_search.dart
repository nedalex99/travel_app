import 'package:get/get.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:travel_app/utils/session_temp.dart';
import 'package:http/http.dart' as http;

class FlightOfferSearch extends GetConnect {
  Future<DefaultResponse> getFlightOffer({
    required String departureCode,
    required String arrivalCode,
  }) async {
    var headers = {
      'Authorization': 'Bearer $amadeusAccessToken',
    };
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$departureCode&destinationLocationCode=$arrivalCode&departureDate=2022-11-01&returnDate=2022-11-18&adults=1&max=5',
      ),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return DefaultResponse(statusCode: 200, status: "success");
    } else {
      return ErrorResponse(status: "error", statusCode: response.statusCode);
    }
  }
}
