import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/photo_album/photo_album_controller.dart';
import 'package:travel_app/ui/to_do_list_screen/components/trips_card_to_do.dart';
import 'package:travel_app/utils/constants/colors.dart';

class PhotoAlbumScreen extends StatelessWidget {
  String tripName;
  PhotoAlbumController photoAlbumController = PhotoAlbumController();

  PhotoAlbumScreen({
    Key? key,
    required this.tripName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kGeneralColor.withOpacity(0.5),
          elevation: 3,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Text(
            "Photo Album $tripName",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
