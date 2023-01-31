import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:sport_test/auth/login.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  static const String route = '/';
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
          content: const Text('Do you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage())),
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
    bool isSwitched = false;

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          controller: _scrollController,
          children: [
            // You can add a settings title
            SettingsItem(
              icons: Icons.person_sharp,
              onTap: () {
                NavbarNotifier.hideBottomNavBar = false;
                navigate(
                  context,
                  Info.route,
                  isRootNavigator: false,
                );
              },
              title: 'Account',
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
            SettingsGroup(
              settingsGroupTitle: 'Privacy',
              settingsGroupTitleStyle: const TextStyle(fontSize: 16),
              items: [
                SettingsItem(
                  onTap: () {
                    NavbarNotifier.hideBottomNavBar = false;
                    navigate(
                      context,
                      About.route,
                      isRootNavigator: false,
                    );
                  },
                  icons: CupertinoIcons.info,
                  title: 'About',
                  titleStyle: const TextStyle(fontSize: 17),
                ),
              ],
            ),
            SettingsGroup(
                settingsGroupTitle: 'Login',
                settingsGroupTitleStyle: const TextStyle(fontSize: 17),
                items: [
                  SettingsItem(
                    icons: Icons.exit_to_app_sharp,
                    onTap: () {
                      NavbarNotifier.hideBottomNavBar = true;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                    title: 'Log out',
                    titleStyle: const TextStyle(fontSize: 17),
                    subtitleStyle: const TextStyle(fontSize: 15),
                  ),
                ])
          ],
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

//Class for Accounts
class Info extends StatelessWidget {
  static const String route = '/Settings/Info';
  const Info({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SettingsItem(
                  icons: CupertinoIcons.person_2,
                  title: 'Member Info',
                  titleStyle: const TextStyle(fontSize: 17),
                  onTap: () {},
                ),
                SettingsItem(
                    icons: CupertinoIcons.nosign,
                    title: 'Manage Membership',
                    titleStyle: const TextStyle(fontSize: 17),
                    onTap: () {})
              ],
            )));
  }
}

//Class for Privacy
class About extends StatelessWidget {
  static const String route = '/Settings/About';

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
                    title: 'Privacy Policy',
                    titleStyle: const TextStyle(fontSize: 17),
                    onTap: () async {
                      var url = Uri.parse("https://www.geeksforgeeks.org/");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
                SettingsItem(
                    icons: CupertinoIcons.book,
                    title: 'Terms of Use',
                    titleStyle: const TextStyle(fontSize: 17),
                    onTap: () async {
                      var url = Uri.parse("https://www.geeksforgeeks.org/");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    })
              ],
            )));
  }
}
