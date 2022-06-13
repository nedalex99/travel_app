import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/utils/constants/images.dart';

class FlightsListCard extends StatelessWidget {
  const FlightsListCard({
    Key? key,
    required this.flightTicket,
  }) : super(key: key);

  final FlightTicket flightTicket;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
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
        ),
        const SizedBox(
          height: 16.0,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: flightTicket.flightCardDetails.departureCode!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${flightTicket.flightCardDetails.departureCode![index]} : ${DateFormat("HH:mm").format(
                      DateTime.parse(
                          flightTicket.flightCardDetails.departureTime![index]),
                    )}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        kFlight,
                        height: 20,
                        width: 20,
                      ),
                      Text(
                        flightTicket.flightCardDetails.flightDuration![index]
                            .replaceRange(
                          0,
                          2,
                          "",
                        ),
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
                    '${flightTicket.flightCardDetails.arrivalCode![index]} : ${DateFormat("HH:mm").format(
                      DateTime.parse(
                          flightTicket.flightCardDetails.arrivalTime![index]),
                    )}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
