import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/photo_album/components/photo_album_setting_controller.dart';
import 'package:travel_app/ui/to_do_list_screen/components/trips_card_to_do.dart';
import 'package:travel_app/utils/constants/colors.dart';

class PhotoAlbumSettingsScreen extends StatelessWidget {
  PhotoAlbumSettingsScreen({
    Key? key,
  }) : super(key: key);

  PhotoAlbumSettingController photoAlbumSettingController =
      Get.put(PhotoAlbumSettingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text(
                "Travel Album",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black87,
                ),
              ),
              leading: BackButton(
                color: Colors.black,
              ),
              backgroundColor: kGeneralColor,
            ),
            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TripCardToDo(
                            text: photoAlbumSettingController
                                .trips[index].flightCardDetails.arrivalCity!,
                            onClick: () {
                              photoAlbumSettingController
                                  .redirectPhotoAlbumPerTripScreen(
                                      photoAlbumSettingController.trips[index]
                                          .flightCardDetails.arrivalCity!);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: photoAlbumSettingController.trips.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
