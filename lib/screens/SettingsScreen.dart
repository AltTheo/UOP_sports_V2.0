import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/authScreen.dart';
import 'package:sport_test/component/memberProfile.dart';
import 'package:sport_test/redundant%20files/simpleNav.dart';
import 'package:sport_test/settingsSubscreen/profile.dart';
import 'package:sport_test/src/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../SettingsSubscreen/About.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  static const String route = '/';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Size size = Size.zero;
  final user = FirebaseAuth.instance.currentUser;

  final _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    if (size.width < 600) {
      _addScrollListener();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void handleScroll() {
    if (size.width > 600) return;
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (NavbarNotifier.isNavbarHidden) {
        NavbarNotifier.hideBottomNavBar = false;
      }
    } else {
      if (!NavbarNotifier.isNavbarHidden) {
        NavbarNotifier.hideBottomNavBar = true;
      }
    }
  }

  void _addScrollListener() {
    _scrollController.addListener(handleScroll);
  }

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
          icon: const Icon(Ionicons.alert_circle_sharp),
          content: Text('Do you want to sign out as \n \n ${user?.email} ?'),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const WelcomeScreen()));
              },
              child: const Text('Accept'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
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
        title: const Text('Settings'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 243, 241, 241),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: ListView(
            controller: _scrollController,
            children: [
              // You can add a settings title
              MemberCard(
                  username: '${user?.displayName}',
                  useremail: '${user?.email}',
                  photo: '${user?.photoURL}'),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(thickness: 0.7),
              const SizedBox(
                height: 30.0,
              ),
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.paintbrush,
                title: 'App Appearance',
                titleStyle: const TextStyle(fontSize: 17),
              ),
              SettingsItem(
                  icons: CupertinoIcons.bell,
                  title: 'Notifications',
                  titleStyle: const TextStyle(fontSize: 17),
                  onTap: () {}),

              SettingsItem(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const About()));
                },
                icons: CupertinoIcons.info,
                title: 'About',
                titleStyle: const TextStyle(fontSize: 17),
              ),
              SettingsItem(
                icons: Icons.message_outlined,
                title: 'Help',
                titleStyle: const TextStyle(fontSize: 17),
              ),

              SettingsItem(
                icons: Icons.exit_to_app_sharp,
                onTap: () {
                  _showAction(context);
                },
                title: 'Log out',
                titleStyle: const TextStyle(fontSize: 17),
                subtitleStyle: const TextStyle(fontSize: 15),
              ),

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
      ),
    );
  }
}

//action button class
@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.purple,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
      ),
    );
  }
}
