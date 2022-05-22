import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class GetHotelsResponse extends DefaultResponse {
  GetHotelsResponse({
    required int statusCode,
    required String status,
    required this.hotelsList,
  }) : super(
          statusCode: statusCode,
          status: status,
        );

  final List<HotelModel> hotelsList;
}
