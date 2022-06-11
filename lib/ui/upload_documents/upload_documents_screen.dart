import 'package:flutter/material.dart';
import 'package:travel_app/ui/upload_documents/components/type_of_documents_card_widget.dart';
import 'package:travel_app/ui/upload_documents/upload_documents_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';

class UploadDocumentsScreen extends StatelessWidget {
  UploadDocumentsScreen({Key? key}) : super(key: key);
  final UploadDocumentsController controller = UploadDocumentsController();

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
          title: const Text(
            "DOCUMENTS",
            style: TextStyle(
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
                  child: Center(
                    child: Column(
                      children: [
                        TypeDocumentsCard(
                          onClick: () {
                            controller.redirectDocumentsList("Identity Card");
                          },
                          text: "Identity Card",
                          leftIcon: IconButton(
                            icon: Image.asset(
                              kDocumentsCard,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList("Identity Card");
                            },
                          ),
                          rightIcon: IconButton(
                            icon: Image.asset(
                              kSettingsArrow,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList("Identity Card");
                            },
                          ),
                        ),
                        TypeDocumentsCard(
                          text: 'Passport',
                          onClick: () {
                            controller.redirectDocumentsList('Passport');
                          },
                          leftIcon: IconButton(
                            icon: Image.asset(
                              kPassport,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList('Passport');
                            },
                          ),
                          rightIcon: IconButton(
                            icon: Image.asset(
                              kSettingsArrow,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList('Passport');
                            },
                          ),
                        ),
                        TypeDocumentsCard(
                          text: 'Plane Tickets',
                          onClick: () {
                            controller.redirectDocumentsList('Plane Tickets');
                          },
                          leftIcon: IconButton(
                            icon: Image.asset(
                              kPlaneTicket,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList('Plane Tickets');
                            },
                          ),
                          rightIcon: IconButton(
                            icon: Image.asset(
                              kSettingsArrow,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList('Plane Tickets');
                            },
                          ),
                        ),
                        TypeDocumentsCard(
                          text: 'Driver\'s License',
                          onClick: () {
                            controller
                                .redirectDocumentsList('Driver\'s License');
                          },
                          leftIcon: IconButton(
                            icon: Image.asset(
                              kCar,
                            ),
                            onPressed: () {
                              controller
                                  .redirectDocumentsList('Driver\'s License');
                            },
                          ),
                          rightIcon: IconButton(
                            icon: Image.asset(
                              kSettingsArrow,
                            ),
                            onPressed: () {
                              controller
                                  .redirectDocumentsList('Driver\'s License');
                            },
                          ),
                        ),
                        TypeDocumentsCard(
                          text: 'Tickets',
                          onClick: () {
                            controller.redirectDocumentsList('Tickets');
                          },
                          leftIcon: IconButton(
                            icon: Image.asset(
                              kTicket,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList('Tickets');
                            },
                          ),
                          rightIcon: IconButton(
                            icon: Image.asset(
                              kSettingsArrow,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList('Tickets');
                            },
                          ),
                        ),
                        TypeDocumentsCard(
                          text: 'Others',
                          onClick: () {
                            controller.redirectDocumentsList('Others');
                          },
                          leftIcon: IconButton(
                            icon: Image.asset(
                              kOthers,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList('Others');
                            },
                          ),
                          rightIcon: IconButton(
                            icon: Image.asset(
                              kSettingsArrow,
                            ),
                            onPressed: () {
                              controller.redirectDocumentsList('Others');
                            },
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
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
