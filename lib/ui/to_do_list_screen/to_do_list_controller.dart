import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/model/passenger_model.dart';
import 'package:travel_app/ui/to_do_list_screen/components/list_per_trip_screen.dart';
import 'package:travel_app/utils/network/firebase/firestore/trips_collection.dart';
import 'package:travel_app/utils/session_temp.dart';

class ToDoListController extends GetxController {
  RxList<FlightTicket> trips = <FlightTicket>[].obs;

  @override
  void onInit() {
    getNameTrips();
    super.onInit();
  }

  void redirectListToDoScreen(String name) {
    Get.to(
      () => ListPerTripScreen(
        nameTrip: name,
      ),
    );
  }

  Future<void> getNameTrips() async {
    await TripsCollection().getTrips().then((value) {
      value.docs.forEach((element) {
        var json = element.data() as Map;
        final FlightCardDetails flightCardDetails =
            FlightCardDetails.fromJson(json['flightCardDetails']);
        final List<Passenger> passengersList = (json['passenger'] as List)
            .map((e) => Passenger.fromJson(e))
            .toList();
        final HotelModel hotelModel =
            HotelModel.fromJson(json['selectedHotel']);
        final List<String> usersUid = (json['usersUid'] as List)
            .map(
              (e) => e.toString(),
            )
            .toList();
        List<String> savedBy =
            (json['savedBy'] as List).map((e) => e.toString()).toList();
        final int budget = json['budget'];
        final FlightTicket flightTicket = FlightTicket(
          flightCardDetails: flightCardDetails,
          passengers: passengersList,
          selectedHotel: hotelModel,
          usersUid: usersUid,
          savedBy: savedBy,
          budget: budget,
        );
        if (flightTicket.usersUid.contains(userLoggedIn.uid)) {
          trips.add(flightTicket);
        }
      });
    });
  }
}
