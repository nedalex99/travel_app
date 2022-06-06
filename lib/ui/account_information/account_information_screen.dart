import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/ui/account_information/account_infromation_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';

class AccountInformationScreen extends StatelessWidget {
  AccountInformationScreen({Key? key}) : super(key: key);
  AccountInformationController controller =
      Get.put(AccountInformationController());

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
            "Account Information",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Obx(
                      () => GestureDetector(
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
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: kGeneralColor,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              100.0,
                            ),
                            child: controller.img.value == ''
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        100.0,
                                      ),
                                    ),
                                    width: 150,
                                    height: 150,
                                  )
                                : Image.network(
                                    controller.img.value,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'First Name',
                            style: kHeaderFieldTextStyle,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          InputField(
                            labelText: "First Name",
                            textInputType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            validator: isValidName,
                            textEditingController:
                                controller.firstNameTextController,
                            onInputFieldChanged: controller.onInputChanged,
                            controller: Get.put(
                              InputFieldController(),
                              tag: "acc_info_first_name",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: kHeaderFieldTextStyle,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          InputField(
                            labelText: "Last Name",
                            textInputType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            validator: isValidName,
                            textEditingController:
                                controller.lastNameTextController,
                            onInputFieldChanged: controller.onInputChanged,
                            controller: Get.put(
                              InputFieldController(),
                              tag: "acc_info_name",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Username',
                            style: kHeaderFieldTextStyle,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          InputField(
                            labelText: "Username",
                            textInputType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.done,
                            validator: isValidName,
                            textEditingController:
                                controller.usernameTextController,
                            onInputFieldChanged: controller.onInputChanged,
                            controller: Get.put(
                              InputFieldController(),
                              tag: "acc_info_username",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                        () => CustomButton(
                          onTap: () {
                            controller.updateUser();
                          },
                          text: 'Save Changes',
                          backgroundColor: controller.isButtonEnabled.value
                              ? const Color(0xFF7B94FF)
                              : kGeneralColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                      controller.updateImage(ImageSource.camera).then(
                            (value) => controller.getImage(),
                          );
                    },
                    icon: const Icon(Icons.camera),
                  ),
                  const Text("Camera"),
                ],
              ),
              const SizedBox(
                width: 90,
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.updateImage(ImageSource.gallery).then(
                            (value) => controller.getImage(),
                          );
                    },
                    icon: const Icon(Icons.image),
                  ),
                  const Text("Gallery"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
