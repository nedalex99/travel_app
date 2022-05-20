import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/city_screen/city_screen.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';

class UserProfile extends StatefulWidget {
  bool done = false;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _imageFile;
  final ImagePicker picker = ImagePicker();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> updateImage(File? pickedFile) async {
    final String? uid = _firebaseAuth.currentUser?.uid;
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref(uid)
        .child('images/$uid')
        .putFile(pickedFile!);

    return taskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Image.asset(
                kPlane2,
                height: 200,
                width: 300,
              ),
            ),
            imageProfile(context),
            const SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 80.0,
              ),
              child: CustomButton(
                backgroundColor: kGeneralColor,
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
                text: 'Set profile picture',
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            widget.done == true
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 80.0,
                    ),
                    child: CustomButton(
                      backgroundColor: kGeneralColor,
                      onTap: () {
                        Get.to(
                          () =>  ChooseCity(),
                        );
                      },
                      text: 'Next',
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      right: 300,
                      top: 140,
                    ),
                    child: Image.asset(
                      kPlane,
                      height: 100,
                      width: 200,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return CircleAvatar(
      radius: 80.0,
      backgroundColor: kGeneralColor.withOpacity(0.3),
      backgroundImage: _imageFile == null
          ? const NetworkImage(
              'https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png',
            )
          : Image.file(File(_imageFile!.path)).image,
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
                      takePhoto(ImageSource.camera);
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
                      takePhoto(ImageSource.gallery);
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

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile?.path != null) {
        _imageFile = File(pickedFile!.path);
        updateImage(File(pickedFile.path));
        widget.done = true;
      }
    });
  }
}
