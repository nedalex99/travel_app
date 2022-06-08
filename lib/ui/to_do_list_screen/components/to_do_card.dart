import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/ui/to_do_list_screen/components/to_do_card_controller.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';

class ToDoCard extends StatelessWidget {
  final String titleToDo;
  final RxList<ToDo> list;

  ToDoCard({
    Key? key,
    required this.titleToDo,
    required this.list,
  }) : super(key: key) {
    controller = ToDoCardController(
      nameTrip: titleToDo,
      list: list,
    );
  }

  late final ToDoCardController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFe6e6e6),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) => {
                      controller.onInputChanged,
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      titleToDo,
                      style: kNormalTextStyle,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        kEdit,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteNote().then(
                              (value) => print("Amers"),
                            );
                      },
                      icon: Image.asset(
                        kDelete,
                        width: 20,
                        height: 20,
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
}
