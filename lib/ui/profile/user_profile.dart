import 'package:flutter/material.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';

class UserProfile extends StatelessWidget {
  final String username;

  const UserProfile({
    Key? key,
    required this.username,
  }) : super(key: key);

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
            Container(
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/3/35/Supermanflying.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      75.0,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    ),
                  ]),
            ),
            const SizedBox(
              height: 30.0,
            ),
             Text(
              username,
            ),
            const SizedBox(
              height: 60.0,
            ),
            CustomButton(
              backgroundColor: Colors.blue,
              onTap: () {},
              text: 'Add profile picture',
            ),
          ],
        ),
      ),
    );
  }
}
