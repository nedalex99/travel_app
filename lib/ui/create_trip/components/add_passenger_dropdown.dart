import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/create_trip/components/add_passenger_dropdown_controller.dart';
import 'package:travel_app/ui/select_flight_ticket/select_flight_ticket_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker_passenger.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_passenger.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/validator.dart';

class AddPassengerDropdown extends StatefulWidget {
  const AddPassengerDropdown({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  final AddPassengerDropdownController controller;
  final GestureTapCallback onTap;

  @override
  _AddPassengerDropdownState createState() => _AddPassengerDropdownState();
}

class _AddPassengerDropdownState extends State<AddPassengerDropdown>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final SelectFlightTicketController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    widget.controller.expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    widget.controller.expandAnimation = CurvedAnimation(
      parent: widget.controller.expandController,
      curve: Curves.fastOutSlowIn,
    );
    widget.controller.rotateController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
  }

  @override
  void dispose() {
    widget.controller.expandController.dispose();
    widget.controller.rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFe6e6e6),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add more passengers",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
            ),
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: widget.controller.expandAnimation,
              child: Container(
                width: Get.width,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: InputFieldPassenger(
                          textCapitalization: TextCapitalization.characters,
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: isValidName,
                          labelText: "First name",
                          onInputFieldChanged: _controller.firstNameChanged,
                          textEditingController:
                              _controller.firstNameTextController,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: InputFieldPassenger(
                          textCapitalization: TextCapitalization.characters,
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: isValidName,
                          labelText: "Last name",
                          onInputFieldChanged: _controller.lastNameChanged,
                          textEditingController:
                              _controller.lastNameTextController,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: InputFieldDatePickerPassenger(
                          textEditingController:
                              _controller.dateBirthTextController,
                          labelText: 'Birth date',
                          isBirthday: true,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CustomButton(
                        onTap: _controller.addPassenger,
                        text: "Add passenger",
                        backgroundColor: kPaleColor,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      GestureDetector(
                        onTap: _controller.findFriend,
                        child: const Text(
                          'Find a friend',
                          style: TextStyle(
                            color: kDark2Color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
