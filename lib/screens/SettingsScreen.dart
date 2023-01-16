import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:sport_test/src/login.dart';

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
          controller:_scrollController,
          children: [
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  icons: CupertinoIcons.person,
                  iconStyle: IconStyle(
                      // backgroundColor: Colors.purple,
                      withBackground: true,
                      iconsColor: Colors.white),
                  onTap: () {
                    NavbarNotifier.hideBottomNavBar = false;
                    navigate(
                      context,
                      Info.route,
                      isRootNavigator: false,
                    );
                  },
                  title: 'Member Info',
                  titleStyle: const TextStyle(fontSize: 17),
                  subtitle: 'manage your membership',
                  subtitleStyle: const TextStyle(fontSize: 15),
                ),
                SettingsItem(
                  onTap: () {
                    _showAction(context);
                  },
                  icons: Icons.exit_to_app_outlined,
                  iconStyle: IconStyle(
                      // backgroundColor: Colors.purple,
                      withBackground: true,
                      iconsColor: Colors.white),
                  title: "Sign Out",
                  titleStyle: const TextStyle(fontSize: 17),
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: 'App preferences',
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    // backgroundColor: Colors.purple
                  ),
                  title: 'Appearance',
                  titleStyle: const TextStyle(fontSize: 17),
                  subtitle: "Make the App yours",
                  subtitleStyle: const TextStyle(fontSize: 15),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.lock_shield_fill,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    // backgroundColor: Colors.purple,
                  ),
                  title: 'Privacy',
                  titleStyle: const TextStyle(fontSize: 17),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    // backgroundColor: Colors.purple,
                  ),
                  title: 'Dark mode',
                  titleStyle: const TextStyle(fontSize: 17),
                  subtitle: "Automatic",
                  subtitleStyle: const TextStyle(fontSize: 15),
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) {
                      setState() {
                        isSwitched = value;
                      }
                    },
                  ),
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: 'Privacy',
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                      // backgroundColor: Colors.purple,
                      ),
                  title: 'About',
                  titleStyle: const TextStyle(fontSize: 17),
                  subtitle: "Learn more about the App",
                  subtitleStyle: const TextStyle(fontSize: 15),
                ),
                SettingsItem(icons: Icons.g_mobiledata, title: 'title', onTap: (){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

class InfoRoute extends CupertinoPageRoute {
  InfoRoute() : super(builder: (BuildContext context) => const Info());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: const Info());
  }
}

class Info extends StatelessWidget {
  static const String route = '/Settings/Info';
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
    );
  }
}
