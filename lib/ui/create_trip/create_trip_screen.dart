import 'package:flutter/material.dart';
import 'package:travel_app/ui/create_trip/create_trip_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_with_suggestions/input_field_with_suggestions.dart';

class CreateTripScreen extends StatelessWidget {
  final CreateTripController controller = Get.put(CreateTripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF0),
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
                                  color: Colors.deepOrange,
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
                                  color: Colors.deepOrange,
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
                                  color: Colors.deepOrange,
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
                            const Text('Skip')
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
