import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ionicons/ionicons.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:sport_test/settingsSubscreen/Info.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/authScreen.dart';
import 'package:sport_test/redundant%20files/simpleNav.dart';
import 'package:sport_test/src/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  static const String route = '/';
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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

  Size size = Size.zero;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/images/white_3.png'))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: ListView(
            controller: _scrollController,
            children: [
              // You can add a settings title
              SettingsGroup(items: [
                SettingsItem(
                  icons: Icons.manage_accounts_outlined,
                  onTap: () {
                    NavbarNotifier.hideBottomNavBar = false;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Info()));
                  },
                  title: 'Manage account',
                  titleStyle: const TextStyle(fontSize: 17),
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
              ]),

              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const About()));
                    },
                    icons: CupertinoIcons.info,
                    title: 'About',
                    titleStyle: const TextStyle(fontSize: 17),
                  ),
                  SettingsItem(
                    icons: Icons.message_outlined,
                    title: 'Help',
                    titleStyle: const TextStyle(fontSize: 17),
                  )
                ],
              ),
              SettingsGroup(items: [
                SettingsItem(
                  icons: Icons.exit_to_app_sharp,
                  onTap: () {
                    _showAction(context);
                  },
                  title: 'Log out',
                  titleStyle: const TextStyle(fontSize: 17),
                  subtitleStyle: const TextStyle(fontSize: 15),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Signed in as ${user?.email}')]),
              )
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

  final VoidCallback? onPressed;
  final Widget icon;

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

//Class for Privacy
class About extends StatelessWidget {
  // static const String route = '/Settings/About';

  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SettingsItem(
                    icons: Icons.remove_red_eye_rounded,
                    title: 'Privacy policy',
                    titleStyle: const TextStyle(fontSize: 17),
                    onTap: () async {
                      var url = Uri.parse("https://sport.port.ac.uk/about-us/policies-and-terms/privacy-policy");
                      await launchUrl(url);
                    }),
                SettingsItem(
                    icons: CupertinoIcons.book,
                    title: 'Policy and terms',
                    titleStyle: const TextStyle(fontSize: 17),
                    onTap: () async {
                      var url = Uri.parse("https://sport.port.ac.uk/about-us/policies-and-terms/");

                      await launchUrl(url);
                    })
              ],
            )));
  }
}
