import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final IconData icons;
  final VoidCallback onTap;

  const SettingItem({
    super.key,
    required this.title,
    required this.icons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListTile(
          onTap: onTap,
          leading: Icon(
            icons,
            size: 30.0,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded)),
    );
  }
}
