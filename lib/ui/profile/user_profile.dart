import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  bool done = false;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _imageFile;
  final ImagePicker picker = ImagePicker();

  Future<String> updateImage(File? pickedFile) async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child('profile_pictures')
        .child(pickedFile!.path)
        .putFile(pickedFile);

    return taskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF0),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150.0,
            ),
            imageProfile(context),
            const SizedBox(
              height: 60.0,
            ),
            CustomButton(
              backgroundColor: Colors.blue,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((bulder) => bottomSheet()),
                );
              },
              text: 'Add profile picture',
            ),
            const SizedBox(
              height: 80.0,
            ),
            widget.done == true
                ? CustomButton(
                    backgroundColor: Colors.blue,
                    onTap: () {
                      Get.to(() =>  DashboardScreen());
                    },
                    text: 'Go to dashboard',
                  )
                : const SizedBox(
                    height: 20,
                  ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return CircleAvatar(
      radius: 80.0,
      backgroundColor: Colors.yellow,
      backgroundImage: _imageFile == null
          ? const NetworkImage(
              'https://upload.wikimedia.org/wikipedia/en/3/35/Supermanflying.png')
          : Image.file(File(_imageFile!.path)).image,
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: 100.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
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
                width: 30,
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
