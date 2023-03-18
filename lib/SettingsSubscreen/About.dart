//Class for Privacy
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/component/settingItem.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  // static const String route = '/Settings/About';

  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: AssetImage('lib/assets/images/white_3.png'))),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  SettingItem(
                      title: 'Privacy',
                      icons: Icons.remove_red_eye_rounded,
                      onTap: () async {
                        var url = Uri.parse("https://www.geeksforgeeks.org/");
                        await launchUrl(url);
                      }),
                  SettingItem(
                      title: 'Terms of Use',
                      icons: CupertinoIcons.book,
                      onTap: () async {
                        var url = Uri.parse("https://www.geeksforgeeks.org/");
                        await launchUrl(url);
                      }),
                ],
              )),
        ));
  }
}
