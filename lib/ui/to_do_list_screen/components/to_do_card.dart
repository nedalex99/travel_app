import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/ui/to_do_list_screen/components/edit_to_do_screen.dart';
import 'package:travel_app/ui/to_do_list_screen/components/to_do_card_controller.dart';
import 'package:travel_app/ui/widgets/check_box/custom_checkbox_widget.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';

class ToDoCard extends StatelessWidget {
  final String titleToDo;
  final RxList<ToDo> list;
  final String cityName;
  final int index;

  ToDoCard({
    Key? key,
    required this.titleToDo,
    required this.list,
    required this.cityName,
    required this.index,
  }) : super(key: key) {
    controller = Get.put(
      ToDoCardController(
        nameTrip: titleToDo,
        list: list,
        cityName: cityName,
      ),
      tag: titleToDo,
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
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isChecked.value,
                  onChanged: (value) {
                    controller.isChecked.toggle();
                  },
                ),
              ),
              Expanded(
                child: Text(
                  titleToDo,
                  style: kNormalTextStyle,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.to(
                      () => EditToDoScreen(
                        nameTrip: cityName,
                        defaultText: titleToDo,
                        index: index,
                      ),
                    ),
                    icon: Image.asset(
                      kEdit,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteNote(titleToDo, cityName);
                    },
                    icon: Image.asset(
                      kDelete,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
