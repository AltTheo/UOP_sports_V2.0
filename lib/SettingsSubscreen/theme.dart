import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/theme_manager.dart';

class ThemeSettingItem extends StatefulWidget {
  const ThemeSettingItem({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThemeSettingItemState createState() => _ThemeSettingItemState();
}

class _ThemeSettingItemState extends State<ThemeSettingItem> {
  String? _theme = 'Match System'; // default selected option

  late final _themes = {
    'Match System': () {},
    'Always Light': () {},
    'Always Dark': () {},
  };

  void _handleRadioValueChange(String? value) {
    final action = _themes[value];
    if (action != null) {
      action();
      setState(() {
        _theme = value;
      });
    } else {
      throw ArgumentError('Invalid radio value: $value');
    }
  }

  Widget _buildRadioOption({
    required String title,
    required String subtitle,
    required String value,
  }) =>
      ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        subtitle: Text(subtitle),
        trailing: Radio(
          value: value,
          groupValue: _theme,
          onChanged: _handleRadioValueChange,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Appearance'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            _buildRadioOption(
              title: 'Match System',
              subtitle: 'Sports app will match your phone settings',
              value: 'Match System',
            ),
            const SizedBox(height: 10),
            _buildRadioOption(
              title: 'Always Light',
              subtitle: 'Sports app will always use a light appearance',
              value: 'Always Light',
            ),
            const SizedBox(height: 10),
            _buildRadioOption(
              title: 'Always Dark',
              subtitle: 'Sports app will always use a dark appearance',
              value: 'Always Dark',
            ),
          ],
        ),
      ),
    );
  }
}
