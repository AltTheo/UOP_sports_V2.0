import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/screens/Activity.dart';
import 'package:sport_test/screens/HomeScreen.dart';

import 'screens/AccountScreen.dart';
import 'screens/BookingScreen.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<StatefulWidget> createState() => NavState();
}

class NavState extends State<Nav> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const BookingScreen(),
    const Activity(),
    Accounts(),
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
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_outlined), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.timer_outlined), label: 'Bookings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_graph_rounded), label: 'Activity'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_sharp), label: 'Account')
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            fixedColor: Colors.purple,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            type: BottomNavigationBarType.fixed));
  }
}
