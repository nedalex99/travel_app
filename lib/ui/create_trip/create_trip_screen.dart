import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/ui/create_trip/components/flight_card.dart';
import 'package:travel_app/ui/create_trip/create_trip_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_with_suggestions/input_field_with_suggestions.dart';

class CreateTripScreen extends StatelessWidget {
  final CreateTripController controller = Get.put(CreateTripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Create your trip",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        elevation: 3,
        backgroundColor: Colors.grey,
        centerTitle: true,
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
                Obx(
                  () => controller.selectedDate.value ==
                          DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: controller.getDate,
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
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedDate.value !=
                          DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: InputFieldDatePicker(
                            text: DateFormat("dd-MM-yyyy")
                                .format(controller.selectedDate.value)
                                .toString(),
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedDeparture.value == "" &&
                          controller.selectedDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.all(
                            16.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: controller.getDepartureZone,
                              child: const Text(
                                "Select a departure zone",
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
                Obx(
                  () => controller.selectedDeparture.value == "" &&
                          controller.selectedDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: InputFieldWithSuggestions(
                            textEditingController:
                                controller.departureZoneController,
                            labelText: 'Departure zone',
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedArrival.value == "" &&
                          controller.selectedDeparture.value == "" &&
                          controller.selectedDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.all(
                            16.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: controller.getDepartureZone,
                              child: const Text(
                                "Select an arrival zone",
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
                Obx(
                  () => controller.selectedArrival.value == "" &&
                          controller.selectedDeparture.value == "" &&
                          controller.selectedDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: InputFieldWithSuggestions(
                            textEditingController:
                                controller.arrivalZoneController,
                            labelText: 'Arrival zone',
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.selectedArrival.value == "" &&
                          controller.selectedDeparture.value == "" &&
                          controller.selectedDate.value !=
                              DateTime(DateTime.now().year - 1)
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: CustomButton(
                                onTap: controller.getFlights,
                                text: 'Search Flights',
                                backgroundColor: Colors.blueGrey,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Skip',
                            )
                          ],
                        )
                      : Container(),
                ),
                Obx(
                  () => Column(
                    children: [
                      controller.selectedArrival.value == "" &&
                              controller.selectedDeparture.value == "" &&
                              controller.selectedDate.value !=
                                  DateTime(DateTime.now().year - 1)
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
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          List<String> duration = [];
                          List<String> departureCode = [];
                          List<String> departureTime = [];
                          List<String> arrivalCode = [];
                          List<String> arrivalTime = [];
                          for (var itinerary in controller
                              .flightList.value.data![index].itineraries!) {
                            duration.add(itinerary.duration!);
                            for (var segment in itinerary.segments!) {
                              departureCode.add(segment.departure!.iataCode!);
                              departureTime.add(segment.departure!.at!);
                              arrivalCode.add(segment.arrival!.iataCode!);
                              arrivalTime.add(segment.arrival!.at!);
                            }
                          }
                          FlightCardDetails flightCardDetails =
                              FlightCardDetails(
                            departureCode: "${departureCode[0]} : ",
                            arrivalCode: "${arrivalCode[0]} : ",
                            departureTime: DateFormat("HH:mm").format(
                              DateTime.parse(
                                departureTime[0],
                              ),
                            ),
                            arrivalTime: DateFormat("HH:mm").format(
                              DateTime.parse(
                                arrivalTime[0],
                              ),
                            ),
                            flightDuration: duration[0],
                            price: controller
                                .flightList.value.data![index].price!.total!,
                            returnArrivalCode: "${arrivalCode[1]} : ",
                            returnDepartureTime: DateFormat("HH:mm").format(
                              DateTime.parse(
                                departureTime[1],
                              ),
                            ),
                            returnFlightDuration: duration[1],
                            returnDepartureCode: "${departureCode[1]} : ",
                            returnArrivalTime: DateFormat("HH:mm").format(
                              DateTime.parse(
                                arrivalTime[1],
                              ),
                            ),
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
                        itemCount: controller.flightList.value.data!.length,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
