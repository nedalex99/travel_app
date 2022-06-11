import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/ui/create_trip/components/flight_card.dart';
import 'package:travel_app/ui/select_flight_ticket/select_flight_ticket_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_custom_picker/input_field_custom_picker.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/validator.dart';

class SelectFlightTicketScreen extends StatelessWidget {
  final FlightCardDetails flightCardDetails;
  final SelectFlightTicketController _controller = Get.put(
    SelectFlightTicketController(),
  );

  SelectFlightTicketScreen({
    Key? key,
    required this.flightCardDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Select passengers",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        elevation: 3,
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Hero(
                    tag: flightCardDetails,
                    child: FlightCard(
                      flightCardDetails: flightCardDetails,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.passengers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(
                                6.0,
                              ),
                            ),
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${_controller.passengers[index].firstName} ${_controller.passengers[index].lastName}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(
                                      _controller.passengers[index].dateBirth,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _controller.passengers[index].gender,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "First passenger",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: InputField(
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
                    child: InputField(
                      textCapitalization: TextCapitalization.characters,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: isValidName,
                      labelText: "Last name",
                      onInputFieldChanged: _controller.lastNameChanged,
                      textEditingController: _controller.lastNameTextController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: InputFieldCustomPicker(
                      text: 'Gender',
                      list: ['Male', 'Female'],
                      textEditingController: _controller.genderTextController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: InputFieldDatePicker(
                      textEditingController:
                          _controller.dateBirthTextController,
                      labelText: 'Birth date',
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
                  GestureDetector(
                    onTap: _controller.findFriend,
                    child: Text(
                      'Find a friend',
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 24.0,
                  ),
                  child: CustomButton(
                    backgroundColor: Colors.blueGrey,
                    onTap: () => _controller.addFlightTicket(
                      flightCardDetails: flightCardDetails,
                    ),
                    text: 'Create ticket',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
