import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/weather_model.dart';
import 'package:travel_app/ui/create_trip/components/hotel_card.dart';
import 'package:travel_app/ui/trips/trip_card_controller.dart';
import 'package:travel_app/ui/weather/weather_on_trip_widget.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/values.dart';
import 'package:travel_app/utils/session_temp.dart';

class TripCard extends StatelessWidget {
  TripCard({
    Key? key,
    required this.flightTicket,
    required this.weather,
    this.isInSavedScreen = false,
  }) : super(key: key) {
    controller = Get.put(
      TripCardController(
        isSaved:
            flightTicket.savedBy.contains(userLoggedIn.uid) || isInSavedScreen
                ? true.obs
                : false.obs,
        flightTicketId: flightTicket.id,
        flightTicket: flightTicket,
      ),
      tag: flightTicket.id,
    );
  }

  final FlightTicket flightTicket;
  final Weather weather;
  final bool isInSavedScreen;
  late final TripCardController controller;

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
                padding: const EdgeInsets.only(top: 20.0),
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
                physics: const NeverScrollableScrollPhysics(),
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
                    ),
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
            child: GestureDetector(
              onTap: () => controller.showModal(
                isInSavedScreen: isInSavedScreen,
              ),
              child: Image.asset(
                kDots,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => controller.showModal(
                isInSavedScreen: isInSavedScreen,
              ),
              child: Image.asset(
                kDots,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: WeatherOnTripWidget(
              weather: controller.weather,
              // iconUrl: getWeatherImage(
              //   weather.condition,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
