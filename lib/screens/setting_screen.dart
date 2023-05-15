import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sport_test/navigation/bottom_nav.dart';
import 'package:sport_test/component/member_profile.dart';
import '../settingssubscreen/about.dart';
import '../auth/auth_screen.dart';
import '../component/setting_item.dart';
import '../settingssubscreen/theme.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  static const String route = '/';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Size size = Size.zero;
  final user = FirebaseAuth.instance.currentUser;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  void _showAction(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          icon: const Icon(
            Ionicons.alert_circle_sharp,
            size: 50,
          ),
          content: Text('${user?.displayName} \nDo you want to sign out?',
              style: const TextStyle(fontSize: 18)),
          actions: [
            TextButton(
              onPressed: () async {
                if (await googleSignIn.isSignedIn() && mounted) {
                  googleSignIn.signOut();
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                        builder: (BuildContext buildContext) =>
                            const BottomNavBar()),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext buildContext) =>
                            const WelcomeScreen()),
                  );
                }
                if (user != null && mounted) {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                        builder: (BuildContext buildContext) =>
                            const BottomNavBar()),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext buildContext) =>
                            const WelcomeScreen()),
                  );
                }
              },
              child: const Text(
                'Accept',
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showPictureTypeBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: <Widget>[
              ListTile(
                  leading: const Icon(CupertinoIcons.photo),
                  title: const Text('Choose from library',
                      style: TextStyle(fontSize: 18)),
                  onTap: () => {pickImageGallery()}),
              ListTile(
                leading: const Icon(CupertinoIcons.photo_camera),
                title: const Text(
                  'Take photo',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () => {pickImageCamera()},
              ),
            ],
          );
        });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> updateUserProfilePicture(File image) async {
    // Get the current user's UID
    final User? user = _auth.currentUser;
    if (user == null) {
      throw Exception('User is not signed in');
    }
    final String uid = user.uid;

    // Upload the selected image to Firebase Storage
    final Reference ref =
        _storage.ref().child('users/$uid/profile_picture.jpg');
    await ref.putFile(image);

    // Get the download URL of the uploaded image
    final String downloadUrl = await ref.getDownloadURL();

    // Save the download URL in Firestore
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('Users')
        .where('userID', isEqualTo: uid)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                firestore
                    .collection('Users')
                    .doc(doc.id)
                    .update({'photoURL': downloadUrl});
              })
            });

    // Update the user's display picture
    await user.updatePhotoURL(downloadUrl);
  }

  File? image;
  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);

      // Call the function to update the user profile picture
      await updateUserProfilePicture(this.image!);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    Navigator.of(context).pop();
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);

      // Call the function to update the user profile picture
      await updateUserProfilePicture(this.image!);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    Navigator.of(context).pop();
  }

//   final Reference storageRef = FirebaseStorage.instance.ref().child('user/profile_picture.jpg');
// final taskSnapshot = await storageRef.putFile(pickedImage);
// final downloadUrl = await taskSnapshot.ref.getDownloadURL();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          'Settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: ListView(
          children: [
            // You can add a settings title
            MemberCard(
              username: '${user?.displayName}',
              photo: '${user?.photoURL}',
              // uid: '${user?.uid}'
            ),
            SettingItem(
                title: 'Edit Picture',
                icons: CupertinoIcons.pencil_ellipsis_rectangle,
                onTap: () {
                  _showPictureTypeBottomSheet(context);
                  // _showSelectionDialog(context);
                }),
            const Divider(thickness: 0.7),
            SettingItem(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ThemeSettingItem()));
                },
                icons: CupertinoIcons.paintbrush,
                title: 'App Appearance'),
            SettingItem(
                title: 'Notifications',
                icons: CupertinoIcons.bell,
                onTap: () {}),
            SettingItem(
              title: 'About',
              icons: CupertinoIcons.info,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const About()));
              },
            ),
            SettingItem(
                title: 'Help', icons: Icons.message_outlined, onTap: () {}),
            SettingItem(
                title: 'Log out',
                icons: Icons.exit_to_app_sharp,
                onTap: () {
                  _showAction(context);
                })
            // Padding(
            //   padding: const EdgeInsets.all(30.0),
            //   child: Column(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [Text('Signed in as ${user?.displayName}')]),
            // )
          ],
        ),
      ),
    );
  }
}
