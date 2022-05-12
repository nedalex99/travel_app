import 'package:flutter/material.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/ui/create_trip/components/flight_card.dart';

class SelectFlightTicketScreen extends StatelessWidget {
  final FlightCardDetails flightCardDetails;

  SelectFlightTicketScreen({
    required this.flightCardDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Hero(
                    tag: flightCardDetails,
                    child: FlightCard(
                      flightCardDetails: flightCardDetails,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
