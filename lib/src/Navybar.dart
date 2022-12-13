import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/screens/Activity.dart';
import 'package:sport_test/screens/HomeScreen.dart';

import '../screens/SettingsScreen.dart';
import '../screens/BookingScreen.dart';

class Navy extends StatefulWidget {
  const Navy({super.key});

  @override
  State<StatefulWidget> createState() => NavyState();
}

class NavyState extends State<Navy> {
  int selectedIndex = 1;
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const BookingScreen(),
    const Activity(),
    const Settings(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     title: Text('Bottom NavBar'), backgroundColor: Colors.purple),
        body: Center(child: widgetOptions.elementAt(selectedIndex)),
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 800), 
          backgroundColor: Colors.purple,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const Icon(Icons.dashboard_outlined, size: 25, color: Colors.purple,),
              const Icon(Icons.timer_outlined, size: 25, color: Colors.purple),
              const Icon(Icons.auto_graph_outlined, size: 25, color: Colors.purple),
              const Icon(Icons.settings, size: 25, color: Colors.purple)
            ], onTap: onItemTapped, ), 
            );
  }
}
