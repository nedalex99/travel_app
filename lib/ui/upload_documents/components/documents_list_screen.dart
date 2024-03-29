import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/upload_documents/components/document_card.dart';
import 'package:travel_app/ui/upload_documents/components/documnets_list_controller.dart';
import 'package:travel_app/ui/widgets/empty_widget.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';

class DocumentsListScreen extends StatelessWidget {
  final String title;

  DocumentsListScreen({
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
                      () => controller.imageList.isNotEmpty
                          ? Column(
                              children: [
                                Obx(
                                  () => ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.imageList.length,
                                    itemBuilder: (context, index) =>
                                        DocumentCard(
                                      nameDocument:
                                          controller.imageList[index].name,
                                      imgURL: controller.imageList[index].url,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.redirectAddDocument();
                                      },
                                      icon: Image.asset(kAdd),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.redirectAddDocument();
                                      },
                                      child: const Text(
                                        'Add Documents',
                                        style: kTitleScreenTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                const EmptyWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 100.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.redirectAddDocument();
                                        },
                                        icon: Image.asset(kAdd),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.redirectAddDocument();
                                        },
                                        child: const Text(
                                          'Add Documents',
                                          style: kTitleScreenTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
