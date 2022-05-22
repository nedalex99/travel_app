import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/passenger_model.dart';
import 'package:travel_app/ui/create_trip/create_trip_controller.dart';
import 'package:travel_app/ui/select_flight_ticket/select_flight_ticket_screen.dart';

class FlightCard extends StatelessWidget {
  FlightCard({
    Key? key,
    required this.flightCardDetails,
  }) : super(key: key);

  CreateTripController tripController = Get.find();
  final FlightCardDetails flightCardDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          6.0,
        ),
        boxShadow: const [
          BoxShadow(blurRadius: 3, spreadRadius: 1, color: Colors.grey)
        ],
      ),
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Departure',
                style: TextStyle(
                  color: Color(
                    0x80000000,
                  ),
                ),
              ),
              Text(
                'Arrival',
                style: TextStyle(
                  color: Color(
                    0x80000000,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: flightCardDetails.departureCode!.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${flightCardDetails.departureCode![index]} : ${DateFormat("HH:mm").format(
                      DateTime.parse(flightCardDetails.departureTime![index]),
                    )}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.flight_takeoff,
                      ),
                      Text(
                        flightCardDetails.flightDuration![index],
                        style: const TextStyle(
                          color: Color(
                            0x80000000,
                          ),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${flightCardDetails.arrivalCode![index]} : ${DateFormat("HH:mm").format(
                      DateTime.parse(flightCardDetails.arrivalTime![index]),
                    )}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              );
            },
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Obx(
                    () => tripController.passengersList.value.isEmpty
                        ? TextButton(
                            onPressed: () async {
                              await Get.to(
                                () => SelectFlightTicketScreen(
                                  flightCardDetails: flightCardDetails,
                                ),
                              )?.then(
                                (value) {
                                  if (value != null) {
                                    tripController.passengersList.value =
                                        value as List<Passenger>;
                                    tripController.selectedFlight.value =
                                        flightCardDetails;
                                    tripController.getHotels();
                                  }
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32.0,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF2212DB,
                                ),
                                borderRadius: BorderRadius.circular(
                                  6.0,
                                ),
                              ),
                              child: const Text(
                                'Select',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${flightCardDetails.price}\$',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: tripController.passengersList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Passenger ${index + 1}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${tripController.passengersList[index].firstName} ${tripController.passengersList[index].lastName}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
