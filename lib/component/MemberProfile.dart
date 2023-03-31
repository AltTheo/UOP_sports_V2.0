import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MemberCard extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final photourl = FirebaseAuth.instance.currentUser?.photoURL;
  final String? username;
  final String photo;

  MemberCard({
    super.key,
    this.username,
    required this.photo,
  });

  // void empty() {
  //   if (photo.isEmpty) {
  //     photo =
  //         'https://www.pngfind.com/pngs/m/676-6764065_default-profile-picture-transparent-hd-png-download.png';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: ClipOval(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  photourl == null
                      ? 'https://static.vecteezy.com/system/resources/thumbnails/004/511/281/small/default-avatar-photo-placeholder-profile-picture-vector.jpg'
                      : photo,
                  height: 95,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  username ?? '',
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Editprofile extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final photourl = FirebaseAuth.instance.currentUser?.photoURL;
  final String photo;

  Editprofile({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Center(
              child: ClipOval(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  photourl == null
                      ? 'https://static.vecteezy.com/system/resources/thumbnails/004/511/281/small/default-avatar-photo-placeholder-profile-picture-vector.jpg'
                      : photo,
                  height: 95,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
