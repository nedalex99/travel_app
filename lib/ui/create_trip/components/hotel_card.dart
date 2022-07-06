import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/ui/create_trip/components/hotel_card_controller.dart';

class HotelCard extends StatelessWidget {
  HotelCard({
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
      () => ClipRRect(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        child: Container(
          margin: EdgeInsets.only(
            bottom: controller.isSelected.value ? 6.0 : 0.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'You will stay at: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: hotelModel.hotel!.name!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
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
                    const TextSpan(
                      text: " 14:00",
                      style: TextStyle(
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
                    const TextSpan(
                      text: " 11:00",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
