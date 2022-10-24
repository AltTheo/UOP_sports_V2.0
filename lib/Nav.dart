import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/Activity.dart';
import 'package:sport_test/HomeScreen.dart';

import 'AccountScreen.dart';
import 'BookingScreen.dart';

class Nav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavState();
}

class NavState extends State<Nav> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
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
                icon: Icon(Icons.home_rounded), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer_outlined), label: 'Bookings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_activity_outlined), label: 'Activity'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp), label: 'Account')
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          fixedColor: Colors.purple,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          type: BottomNavigationBarType.fixed
        ));
  }
}
