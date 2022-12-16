// ignore: file_names
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/src/login.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void _showAction(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('are you sure ?'),
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

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(10),
        child: ListView(
          children: [
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  icons: CupertinoIcons.person,
                  iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                      withBackground: true,
                      iconsColor: Colors.white),
                  onTap: () {},
                  title: 'Member Info',
                  titleStyle: const TextStyle(fontSize: 20),
                  subtitle: 'manage your membership',
                  subtitleStyle: const TextStyle(fontSize: 16),
                ),
                SettingsItem(
                  onTap: () {
                    _showAction(context);
                  },
                  icons: Icons.exit_to_app_outlined,
                  iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                      withBackground: true,
                      iconsColor: Colors.white),
                  title: "Sign Out",
                  titleStyle: const TextStyle(fontSize: 20),
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
                      backgroundColor: Colors.purple),
                  title: 'Appearance',
                  titleStyle: const TextStyle(fontSize: 20),
                  subtitle: "Make the App yours",
                  subtitleStyle: const TextStyle(fontSize: 16),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.lock_shield_fill,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Privacy',
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Dark mode',
                  subtitle: "Automatic",
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
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about the App",
                ),
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
