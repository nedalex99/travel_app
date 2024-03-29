import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/to_do_list_screen/components/add_to_do_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

class AddToDoScreen extends StatelessWidget {
  AddToDoScreen({
    Key? key,
    required this.nameTrip,
  }) : super(key: key);
  final String nameTrip;
  final AddToDoController controller = Get.put(
    AddToDoController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.noteTextEditingController,
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Create a new note!!',
                        labelText: ' My Note',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                    ),
                  ),
                  CustomButton(
                    onTap: () {
                      controller.addNote(nameTrip: nameTrip).then(
                            (value) => Get.defaultDialog(
                              title: "Success!",
                              middleText: "Your note has been added!",
                              backgroundColor: kGeneralColor,
                              titleStyle: kNormalTextStyle,
                              radius: 10,
                            ).then(
                              (value) => Get.back(),
                            ),
                          );
                    },
                    text: "Add",
                    backgroundColor: kGeneralColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
