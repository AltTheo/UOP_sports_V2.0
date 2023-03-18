import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MemberCard extends StatelessWidget {
  final String username;
  final String useremail;
  String photo;

  MemberCard(
      {super.key,
      required this.username,
      required this.useremail,
      required this.photo});

  void empty() {
    if (photo.isEmpty) {
      photo =
          'https://www.pngfind.com/pngs/m/676-6764065_default-profile-picture-transparent-hd-png-download.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: ClipOval(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(photo),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          children: [
            Text(
              username,
              style: const TextStyle(fontSize: 28),
            ),
            Text(
              useremail,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
