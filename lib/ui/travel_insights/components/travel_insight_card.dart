import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/tours_and_activities_model.dart';
import 'package:travel_app/ui/travel_insights/components/travel_insight_card_controller.dart';

class TravelInsightCard extends StatelessWidget {
  TravelInsightCard({
    Key? key,
    required this.toursAndActivitiesModel,
    this.flightTicket,
  }) : super(key: key) {
    controller = Get.put(
      TravelInsightCardController(
        toursAndActivitiesModel: toursAndActivitiesModel,
        flightTicket: flightTicket,
      ),
      tag: toursAndActivitiesModel.id!,
    );
  }

  final FlightTicket? flightTicket;
  final ToursAndActivitiesModel toursAndActivitiesModel;
  late final TravelInsightCardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 5,
            color: Colors.black,
          ),
        ],
      ),
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          toursAndActivitiesModel.pictures![0] != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        8,
                      ),
                    ),
                    child: Image.network(
                      toursAndActivitiesModel.pictures![0],
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : Container(),
          Text(
            toursAndActivitiesModel.name!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  toursAndActivitiesModel.shortDescription!,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: controller.textShowMoreFlag.value ? null : 3,
                  overflow: controller.textShowMoreFlag.value
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                ),
                GestureDetector(
                  onTap: () => controller.textShowMoreFlag.value =
                      !controller.textShowMoreFlag.value,
                  child: Text(
                    controller.textShowMoreFlag.value
                        ? 'show less'
                        : 'show more',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          toursAndActivitiesModel.rating != null
              ? Text(
                  'Rating: (${double.tryParse(toursAndActivitiesModel.rating!)?.toStringAsFixed(2)}/5)',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              : Container(),
          Text(
            'Price: ${toursAndActivitiesModel.price!.amount!} ${toursAndActivitiesModel.price!.currencyCode!}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => controller.openLocation(
                  latitude: double.tryParse(
                      toursAndActivitiesModel.geoCode!.latitude!)!,
                  longitude: double.tryParse(
                      toursAndActivitiesModel.geoCode!.longitude!)!,
                ),
                child: const Text(
                  "See location",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isChecked.value,
                  onChanged: controller.onToDoPress,
                ),
              ),
              const Text(
                'Add To Do',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
