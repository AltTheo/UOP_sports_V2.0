//Class for Privacy
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/component/setting_item.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  // static const String route = '/Settings/About';

  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SettingItem(
                    title: 'Privacy',
                    icons: Icons.remove_red_eye_rounded,
                    onTap: () async {
                      var url = Uri.parse(
                          "https://sport.port.ac.uk/about-us/policies-and-terms/privacy-policy");
                      await launchUrl(url);
                    }),
                SettingItem(
                    title: 'Terms of Use',
                    icons: CupertinoIcons.book,
                    onTap: () async {
                      var url = Uri.parse(
                          "https://www.port.ac.uk/about-us/structure-and-governance/legal/terms-and-conditions/website-terms-and-conditions");
                      await launchUrl(url);
                    }),
              ],
            )));
  }
}
