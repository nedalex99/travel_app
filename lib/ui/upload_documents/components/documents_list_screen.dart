import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/upload_documents/components/document_card.dart';
import 'package:travel_app/ui/upload_documents/components/documnets_list_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';

class DocumentsScreen extends StatelessWidget {
  String title;

  DocumentsScreen({
    Key? key,
    required this.title,
  }) : super(key: key) {
    controller = Get.put(
      DocumentsListController(
        title: title,
      ),
    );
  }

  late final DocumentsListController controller;

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
            title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  children: [
                    Obx(
                      () => DocumentCard(
                        nameDocument: 'nameDocument',
                        imgURL: controller.img.value,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
