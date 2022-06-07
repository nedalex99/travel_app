import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/to_do_list_screen/components/add_to_do_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

class AddToDoScreen extends StatelessWidget {
  AddToDoScreen({Key? key}) : super(key: key);
  AddToDoController controller = AddToDoController();

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
                    onTap: controller.addNote,
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
