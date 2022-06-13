import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/airport_model.dart';
import 'package:travel_app/ui/create_trip/create_trip_controller.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_with_suggestions/input_field_with_suggestions_controller.dart';

class InputFieldWithSuggestions extends StatelessWidget {
  final CreateTripController tripController = Get.find();
  final TextEditingController textEditingController;
  final String labelText;
  final IconData icon;

  late final InputFieldWithSuggestionsController _inputController;

  InputFieldWithSuggestions({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    required this.icon,
  }) : super(key: key) {
    _inputController = Get.put(
      InputFieldWithSuggestionsController(),
      tag: labelText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TypeAheadField<AirportModel>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: textEditingController,
          onChanged: (value) {
            _inputController.validateAirport(text: value);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(
              8,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            errorText: _inputController.errorText.value == ""
                ? null
                : _inputController.errorText.value,
            prefixIcon: Icon(
              icon,
            ),
          ),
        ),
        suggestionsCallback: (pattern) {
          if (pattern.length > 2) {
            return tripController.getSuggestionsOfZoneByPattern(
                pattern: pattern);
          } else {
            return List.empty();
          }
        },
        itemBuilder: (context, itemData) {
          return ListTile(
            title: Text(
              itemData.name!,
            ),
          );
        },
        onSuggestionSelected: (item) {
          textEditingController.text = item.name!;
          if (labelText == 'Departure zone') {
            tripController.selectedDepartureAirport = item;
          } else {
            tripController.selectedArrivalAirport = item;
          }
          _inputController.validateAirport(
            text: textEditingController.text,
          );
        },
      ),
    );
  }
}
