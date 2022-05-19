import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  final Function onTap;

  CustomCheckbox({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => onTap,
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              4.0,
            ),
          ),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
            width: 1.5,
          ),
        ),
        child: isSelected
            ? const Center(
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.black,
                  size: 21.5,
                ),
              )
            : null,
      ),
    );
  }
}
