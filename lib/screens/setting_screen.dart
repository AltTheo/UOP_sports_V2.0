import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sport_test/navigation/bottom_nav.dart';
import 'package:sport_test/settingssubscreen/manage.dart';
import 'package:sport_test/component/member_profile.dart';
import '../settingssubscreen/about.dart';
import '../auth/auth_screen.dart';
import '../component/setting_item.dart';

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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: ListView.builder(
//         controller: _scrollController,
//           itemCount: 100,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text('Settingggggggggggggggggggggggggg $index'),
//             );
//           }),
//     );
//   }
// }

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
                username: '${user?.displayName}', photo: '${user?.photoURL}'),
            SettingItem(
                title: 'Edit Profile',
                icons: CupertinoIcons.pencil_ellipsis_rectangle,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Manage()));
                }),
            const Divider(thickness: 0.7),
            SettingItem(
                onTap: () {},
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
