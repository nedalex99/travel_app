import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/model/passenger_model.dart';
import 'package:travel_app/ui/to_do_list_screen/components/list_per_trip_screen.dart';
import 'package:travel_app/utils/network/firebase/firestore/trips_collection.dart';

class ToDoListController extends GetxController {
  RxList<FlightTicket> trips = <FlightTicket>[].obs;

  @override
  void onInit() {
    //getTrips();
    super.onInit();
  }

  void redirectListToDoScreen() {
    Get.to(
      () => ListPerTripScreen(),
    );
  }
// Future<void> getTrips() async {
//   await TripsCollection().getTrips().then((value) {
//     value.docs.forEach((element) {
//       var json = element.data() as Map;
//       print(json);
//       final FlightCardDetails flightCardDetails =
//       FlightCardDetails.fromJson(json['flightCardDetails']);
//       final List<Passenger> passengersList = (json['passenger'] as List)
//           .map((e) => Passenger.fromJson(e))
//           .toList();
//       final HotelModel hotelModel =
//       HotelModel.fromJson(json['selectedHotel']);
//       final FlightTicket flightTicket = FlightTicket(
//         flightCardDetails: flightCardDetails,
//         passengers: passengersList,
//         selectedHotel: hotelModel,
//       );
//       trips.add(flightTicket);
//     });
//   });
// }
}
