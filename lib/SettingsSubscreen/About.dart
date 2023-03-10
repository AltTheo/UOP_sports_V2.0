//Class for Privacy
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/white_3.png'))),
          child: Padding(
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
              )),
        ));
  }
}