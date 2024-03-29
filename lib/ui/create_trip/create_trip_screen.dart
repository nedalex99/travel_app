import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/ui/create_trip/components/flight_card.dart';
import 'package:travel_app/ui/create_trip/components/hotel_card_details.dart';
import 'package:travel_app/ui/create_trip/create_trip_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_with_suggestions/input_field_with_suggestions.dart';
import 'package:travel_app/utils/constants/colors.dart';

class CreateTripScreen extends StatelessWidget {
  final CreateTripController controller = Get.put(CreateTripController());

  CreateTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Create your trip",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        elevation: 3,
        backgroundColor: kGeneralColor,
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SafeArea(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: GestureDetector(
                        onTap: controller.readAirportsJson,
                        child: const Text(
                          'Let\'s start planning your trip',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => controller.getDate(isFromDeparture: true),
                      child: const Text(
                        "Select a starting date",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Obx(
                  () => controller.selectedDepartureDate.value !=
                          DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: InputFieldDatePicker(
                            text: DateFormat("dd-MM-yyyy")
                                .format(controller.selectedDepartureDate.value)
                                .toString(),
                            textEditingController: controller.dateOfDeparture,
                            labelText: 'Departure date',
                            isBirthday: false,
                          ),
                        )
                      : Container(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Obx(
                  () => controller.selectedDepartureDate.value !=
                          DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () =>
                                  controller.getDate(isFromDeparture: false),
                              child: const Text(
                                "Select an arrival date",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Obx(
                  () => controller.selectedArrivalDate.value !=
                          DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: InputFieldDatePicker(
                            text: DateFormat("dd-MM-yyyy")
                                .format(controller.selectedArrivalDate.value)
                                .toString(),
                            textEditingController: controller.dateOfArrival,
                            labelText: 'Arrival date',
                            isBirthday: false,
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedDeparture.value == "" &&
                          controller.selectedDepartureDate.value !=
                              DateTime(DateTime.now().year - 1) &&
                          controller.selectedArrival.value == "" &&
                          controller.selectedArrivalDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? const Padding(
                          padding: EdgeInsets.all(
                            16.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select a departure zone",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedDeparture.value == "" &&
                          controller.selectedDepartureDate.value !=
                              DateTime(DateTime.now().year - 1) &&
                          controller.selectedArrival.value == "" &&
                          controller.selectedArrivalDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: InputFieldWithSuggestions(
                            textEditingController:
                                controller.departureZoneController,
                            labelText: 'Departure zone',
                            icon: Icons.flight_takeoff,
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedDeparture.value == "" &&
                          controller.selectedDepartureDate.value !=
                              DateTime(DateTime.now().year - 1) &&
                          controller.selectedArrival.value == "" &&
                          controller.selectedArrivalDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? const Padding(
                          padding: EdgeInsets.all(
                            16.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select an arrival zone",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedDeparture.value == "" &&
                          controller.selectedDepartureDate.value !=
                              DateTime(DateTime.now().year - 1) &&
                          controller.selectedArrival.value == "" &&
                          controller.selectedArrivalDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: InputFieldWithSuggestions(
                            textEditingController:
                                controller.arrivalZoneController,
                            labelText: 'Arrival zone',
                            icon: Icons.flight_land,
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedDeparture.value == "" &&
                          controller.selectedDepartureDate.value !=
                              DateTime(DateTime.now().year - 1) &&
                          controller.selectedArrival.value == "" &&
                          controller.selectedArrivalDate.value !=
                              DateTime(DateTime.now().year - 1) &&
                          controller.flightList.value.data!.isEmpty
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: CustomButton(
                                onTap: controller.getFlights,
                                text: 'Search Flights',
                                backgroundColor: kGeneralColor,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        )
                      : Container(),
                ),
                Obx(
                  () => Column(
                    children: [
                      controller.flightList.value.data!.isNotEmpty
                          ? const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.all(
                                  16.0,
                                ),
                                child: Text(
                                  'Flights found',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      Obx(
                        () => controller.selectedFlight.value?.departureCode !=
                                null
                            ? FlightCard(
                                flightCardDetails:
                                    controller.selectedFlight.value!,
                              )
                            : Container(),
                      ),
                      Obx(
                        () => controller.selectedFlight.value?.departureCode ==
                                null
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  List<String> duration = [];
                                  List<String> departureCode = [];
                                  List<String> departureTime = [];
                                  List<String> arrivalCode = [];
                                  List<String> arrivalTime = [];
                                  for (var itinerary in controller.flightList
                                      .value.data![index].itineraries!) {
                                    for (var segment in itinerary.segments!) {
                                      duration.add(segment.duration!);
                                      departureCode
                                          .add(segment.departure!.iataCode!);
                                      departureTime.add(segment.departure!.at!);
                                      arrivalCode
                                          .add(segment.arrival!.iataCode!);
                                      arrivalTime.add(segment.arrival!.at!);
                                    }
                                  }
                                  FlightCardDetails flightCardDetails =
                                      FlightCardDetails(
                                    departureCode: departureCode,
                                    arrivalCode: arrivalCode,
                                    departureTime: departureTime,
                                    arrivalTime: arrivalTime,
                                    flightDuration: duration,
                                    arrivalLong:
                                        controller.selectedArrivalAirport.lon!,
                                    arrivalLat:
                                        controller.selectedArrivalAirport.lat!,
                                    price: controller.flightList.value
                                        .data![index].price!.total!,
                                    departureCity: controller
                                        .selectedDepartureAirport.city!,
                                    arrivalCity:
                                        controller.selectedArrivalAirport.city!,
                                  );
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 16.0,
                                    ),
                                    child: FlightCard(
                                      flightCardDetails: flightCardDetails,
                                    ),
                                  );
                                },
                                itemCount:
                                    controller.flightList.value.data!.length,
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Obx(
                  () => controller.hotelSelected.value.hotel != null
                      ? Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Selected hotel',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            HotelCardDetails(
                              hotelModel: controller.hotelSelected.value,
                              checkIn: controller.selectedDepartureDate.value
                                  .toString(),
                              checkOut: controller.selectedDepartureDate.value
                                  .toString(),
                            ),
                          ],
                        )
                      : Container(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Obx(
                  () => controller.hotelSelected.value.hotel != null &&
                          controller.budget.value == 0
                      ? GestureDetector(
                          onTap: controller.setBudget,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_circle_outline_rounded,
                                size: 26,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Set a budget',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.hotelSelected.value.hotel != null &&
                          controller.budget.value != 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Budget available for this trip: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text: '${controller.budget.value}\$',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.budget.value != 0
                      ? CustomButton(
                          onTap: controller.onSaveTrip,
                          text: 'Save trip',
                          backgroundColor: Colors.blue,
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.hotelsList.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 16,
                                top: 16.0,
                                bottom: 8,
                              ),
                              child: Text(
                                'Available hotels',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.hotelsList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () =>
                                      controller.onHotelSelected(index),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      6.0,
                                    ),
                                    child: HotelCardDetails(
                                      hotelModel: controller.hotelsList[index],
                                      checkIn: controller
                                          .selectedDepartureDate.value
                                          .toString(),
                                      checkOut: controller
                                          .selectedDepartureDate.value
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
