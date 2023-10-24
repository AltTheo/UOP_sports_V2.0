import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bookingitem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const Bookingitem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            ListTile(
              subtitle: Text(
                subtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 18),
              ),
              leading: const Icon(
                CupertinoIcons.timer_fill,
                size: 40.0,
                color: Colors.purple,
              ),
              title: Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry>[
                    PopupMenuItem(
                        value: 1,
                        onTap: () {},
                        child: const Text(
                          'Edit',
                          style: TextStyle(fontSize: 18),
                        )),
                    PopupMenuItem(
                        value: 2,
                        onTap: onTap,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 18),
                        )),
                  ];
                },
              ),
            ),
            const Divider(
              thickness: 1,
            )
          ],
        ));
  }
}
