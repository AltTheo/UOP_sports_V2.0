//Class for Accounts
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  // static const String route = '/Settings/Info';
  const Info({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage Account'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/white_3.png'))),
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  SettingsGroup(items: [
                    SettingsItem(
                      icons: CupertinoIcons.person,
                      title: 'Member Info',
                      titleStyle: const TextStyle(fontSize: 17),
                      onTap: () {},
                    ),
                    SettingsItem(
                        icons: CupertinoIcons.pencil_ellipsis_rectangle,
                        title: 'Manage Membership',
                        titleStyle: const TextStyle(fontSize: 17),
                        onTap: () async {
                          var url = Uri.parse(
                              "https://uniofportsmouth.leisurecloud.net/Connect/mrmResourceStatus.aspx");
                          await launchUrl(url);
                        })
                  ]),
                ],
              )),
        ));
  }
}
