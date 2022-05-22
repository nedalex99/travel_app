import 'dart:convert';

import 'package:get/get.dart';
import 'package:travel_app/model/flights_model.dart';
import 'package:travel_app/utils/network/amadeus_api/flight_offer_search/get_flight_offer_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:travel_app/utils/session_temp.dart';
import 'package:http/http.dart' as http;

class FlightOfferSearch extends GetConnect {
  Future<DefaultResponse> getFlightOffer({
    required String departureCode,
    required String arrivalCode,
    required String departureDate,
    required String arrivalDate,
  }) async {
    var headers = {
      'Authorization': 'Bearer $amadeusAccessToken',
    };
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$departureCode&destinationLocationCode=$arrivalCode&departureDate=$departureDate&returnDate=$arrivalDate&adults=1&max=2',
      ),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var json = jsonDecode(
      await response.stream.bytesToString(),
    );

    if (response.statusCode == 200) {
      return GetFlightOfferResponse(
        statusCode: 200,
        status: "success",
        flightModel: FlightsModel.fromJson(
          json,
        ),
      );
    } else {
      return ErrorResponse(status: "error", statusCode: response.statusCode);
    }
  }
}
