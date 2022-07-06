import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/ui/create_trip/components/hotel_card_controller.dart';

class HotelCardDetails extends StatelessWidget {
  HotelCardDetails({
    Key? key,
    required this.hotelModel,
    required this.checkIn,
    required this.checkOut,
  }) : super(key: key) {
    controller = Get.put(
      HotelCardController(),
      tag: hotelModel.hotel!.hotelId!,
    );
  }

  final HotelModel hotelModel;
  final String checkIn;
  final String checkOut;
  late final HotelCardController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          bottom: controller.isSelected.value ? 6.0 : 0.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            2.0,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,
              color: Color(0xFFe6e6e6),
            )
          ],
        ),
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hotelModel.hotel!.name!,
            ),
            Row(
              children: _createStars(
                rating: hotelModel.hotel!.rating!,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                ),
                const SizedBox(
                  width: 2.0,
                ),
                Text(
                  hotelModel.hotel!.address!.lines![0],
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // hotelModel.hotel!.description!.text ?? "",
                    hotelModel.hotel!.description != null
                        ? hotelModel.hotel!.description!.text!
                        : "",
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
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Check in: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: checkIn,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Check out: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: checkOut,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Room available: ',
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Text(
                hotelModel.offers![0].room!.typeEstimated!.category!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Text(
                hotelModel.offers![0].room!.description!.text!,
              ),
            ),
            Text(
              'Contact: ${hotelModel.hotel!.contact!.phone!}',
            ),
            GestureDetector(
              onTap: () => controller.openLocation(
                latitude: hotelModel.hotel!.latitude!,
                longitude: hotelModel.hotel!.longitude!,
              ),
              child: const Text(
                "See location",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Text(
                  '${hotelModel.offers![0].price!.total!} ${hotelModel.offers![0].price!.currency!}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createStars({
    required String rating,
  }) {
    List<Widget> widgetList = [];
    widgetList.add(
      const Text(
        'Rating: ',
      ),
    );
    for (int i = 0; i < int.tryParse(rating)!; i++) {
      widgetList.add(
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    }
    return widgetList;
  }
}
