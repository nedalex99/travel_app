import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/photo_album/photo_album_controller.dart';
import 'package:travel_app/ui/upload_documents/components/document_card.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/empty_widget.dart';
import 'package:travel_app/utils/constants/colors.dart';

class PhotoAlbumScreen extends StatelessWidget {
  String tripName;
  late PhotoAlbumController photoAlbumController;

  PhotoAlbumScreen({
    Key? key,
    required this.tripName,
  }) : super(key: key) {
    photoAlbumController = Get.put(PhotoAlbumController(nameTrip: tripName));
  }

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
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Obx(
                    () => photoAlbumController.list.isEmpty
                        ? const EmptyWidget()
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: photoAlbumController.list.length,
                            itemBuilder: (context, index) => DocumentCard(
                              nameDocument: '',
                              imgURL: photoAlbumController.list[index].url,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 80,
                      bottom: 20,
                    ),
                    child: CustomButton(
                      onTap: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          backgroundColor: kGeneralColor,
                          context: context,
                          builder: ((bulder) => bottomSheet()),
                        );
                      },
                      text: "Add a photo",
                      backgroundColor: kGeneralColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 70.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: kGeneralColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      photoAlbumController.uploadPhoto();
                    },
                    icon: const Icon(Icons.camera),
                  ),
                  const Text("Camera"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
