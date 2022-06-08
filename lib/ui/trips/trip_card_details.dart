import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/create_trip/components/hotel_card_details.dart';

class TripCardDetails extends StatelessWidget {
  const TripCardDetails({
    Key? key,
    required this.flightTicket,
  }) : super(key: key);

  final FlightTicket flightTicket;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          6.0,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.grey,
          ),
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
          const SizedBox(
            height: 16.0,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: flightTicket.flightCardDetails.departureCode!.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${flightTicket.flightCardDetails.departureCode![index]} : ${DateFormat("HH:mm").format(
                      DateTime.parse(
                          flightTicket.flightCardDetails.departureTime![index]),
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              );
            },
          ),
          HotelCardDetails(
            hotelModel: flightTicket.selectedHotel,
            checkIn: flightTicket.flightCardDetails.departureTime![0],
            checkOut: flightTicket.flightCardDetails.arrivalTime![0],
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: flightTicket.passengers.length,
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
                      "${flightTicket.passengers[index].firstName} ${flightTicket.passengers[index].lastName}",
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
    );
  }
}
