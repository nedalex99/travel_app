import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/ui/select_flight_ticket/select_flight_ticket_screen.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({
    Key? key,
    required this.flightCardDetails,
  }) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${flightCardDetails.departureCode} : ${flightCardDetails.departureTime}',
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
                    flightCardDetails.flightDuration,
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
                '${flightCardDetails.arrivalCode} : ${flightCardDetails.arrivalTime}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${flightCardDetails.returnDepartureCode} : ${flightCardDetails.returnDepartureTime}',
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
                    flightCardDetails.returnFlightDuration,
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
                '${flightCardDetails.returnArrivalCode} : ${flightCardDetails.returnArrivalTime}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  TextButton(
                    onPressed: () => Get.to(
                      () => SelectFlightTicketScreen(
                        flightCardDetails: flightCardDetails,
                      ),
                    ),
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
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
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
            ],
          ),
        ],
      ),
    );
  }
}
