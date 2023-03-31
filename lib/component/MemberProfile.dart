import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/component/settingItem.dart';

// ignore: must_be_immutable
class MemberCard extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final photourl = FirebaseAuth.instance.currentUser?.photoURL;
  final String username;
  final String photo;

  MemberCard({
    super.key,
    required this.username,
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
                  height: 100,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  username,
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ],
        ),
        SettingItem(
            title: 'Manage Account',
            icons: CupertinoIcons.pencil_ellipsis_rectangle,
            onTap: () {})
      ],
    );
  }
}
