import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/create_trip/components/hotel_card.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';

class TripCard extends StatelessWidget {
  const TripCard({
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
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Text(
                "Trip in ${flightTicket.flightCardDetails.arrivalCity!}",
                style: kTextColoredStyle,
              ),
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
                itemCount: flightTicket.flightCardDetails.departureCode!.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${flightTicket.flightCardDetails.departureCode![index]} : ${DateFormat("HH:mm").format(
                          DateTime.parse(flightTicket
                              .flightCardDetails.departureTime![index]),
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
                            flightTicket
                                .flightCardDetails.flightDuration![index]
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
                          DateTime.parse(flightTicket
                              .flightCardDetails.arrivalTime![index]),
                        )}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: HotelCard(
                  hotelModel: flightTicket.selectedHotel,
                  checkIn: flightTicket.flightCardDetails.departureTime![0],
                  checkOut: flightTicket.flightCardDetails.arrivalTime![0],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(kDots),
          ),
        ],
      ),
    );
  }
}
