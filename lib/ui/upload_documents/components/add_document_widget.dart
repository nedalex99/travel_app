import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/upload_documents/components/add_document_widget_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_custom_picker/input_field_custom_picker.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';

class AddDocumentWidget extends StatelessWidget {
  AddDocumentWidget({Key? key}) : super(key: key);
  AddDocumentWidgetController controller = AddDocumentWidgetController();
  List<String> typesOfDocuments = [
    'Identity Card',
    'Passport',
    'Plane Tickets',
    'Driver\'s License',
    'Tickets',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name of the document',
                        style: kHeaderFieldTextStyle,
                      ),
                      InputField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: Get.put(
                          InputFieldController(),
                          tag: "add_document_field",
                        ),
                        textInputAction: TextInputAction.next,
                        validator: isValidName,
                        textInputType: TextInputType.text,
                        onInputFieldChanged: controller.onInputChanged,
                        labelText: 'Enter name of the document',
                        textEditingController:
                            controller.nameDocumentTextController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Type of the document',
                  style: kHeaderFieldTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    top: 8.0,
                  ),
                  child: InputFieldCustomPicker(
                    text: 'Type Of Documents',
                    list: typesOfDocuments,
                    textEditingController:
                        controller.typeOfDocumentTextController,
                  ),
                ),
                CustomButton(
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
                  text: 'Upload document',
                  backgroundColor: kGeneralColor,
                )
              ],
            ),
          ),
        ),
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
                      controller.uploadDocument();
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
