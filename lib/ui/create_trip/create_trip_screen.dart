import 'package:flutter/material.dart';
import 'package:travel_app/ui/create_trip/create_trip_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker.dart';

class CreateTripScreen extends StatelessWidget {
  final CreateTripController controller = Get.put(CreateTripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      ? InputFieldDatePicker(
                          text: DateFormat("dd-MM-yyyy")
                              .format(controller.selectedDate.value)
                              .toString(),
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
