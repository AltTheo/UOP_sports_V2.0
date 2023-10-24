import 'package:flutter/material.dart';

class ThemeManager extends StatefulWidget {
  const ThemeManager({Key? key, required this.child}) : super(key: key);
  
  final Widget child;

  @override
  _ThemeManagerState createState() => _ThemeManagerState();

  static of(BuildContext context) {}
}

class _ThemeManagerState extends State<ThemeManager> {
  late ThemeData _themeData;
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _themeData =
          _isDarkMode ? ThemeData.dark() : ThemeData.light();
    });
  }

  @override
  void initState() {
    super.initState();
    _themeData = ThemeData.light();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Manager',
      theme: _themeData,
      home: widget.child,
    );
  }
}