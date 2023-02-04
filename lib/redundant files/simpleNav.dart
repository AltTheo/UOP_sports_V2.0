import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sport_test/screens/Activity.dart';
import 'package:sport_test/screens/HomeScreen.dart';

import '../screens/Services.dart';
import '../screens/SettingsScreen.dart';

class SimpleNav extends StatefulWidget {
  const SimpleNav({super.key});

  @override
  State<StatefulWidget> createState() => SimpleNavState();
}

class SimpleNavState extends State<SimpleNav> {
  int selectedIndex = 1;
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const Service(),
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
        body: Navigator(
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              maintainState: true,
              builder: (BuildContext context) => widgetOptions[selectedIndex],
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            useLegacyColorScheme: false,
            enableFeedback: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: Icon(CupertinoIcons.home),
                  tooltip: 'News Feed',
                  icon: Icon(CupertinoIcons.home),
                  label: 'home'),
              BottomNavigationBarItem(
                  activeIcon: Icon(CupertinoIcons.sportscourt_fill),
                  tooltip: 'Services at centre',
                  icon: Icon(CupertinoIcons.sportscourt),
                  label: 'Services'),
              BottomNavigationBarItem(
                  activeIcon: Icon(CupertinoIcons.graph_circle_fill),
                  tooltip: 'How busy is the centre',
                  icon: Icon(CupertinoIcons.graph_circle),
                  label: 'Activity'),
              BottomNavigationBarItem(
                tooltip: 'Settings',
                  icon: Icon(CupertinoIcons.settings), label: 'Settings')
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            fixedColor: Colors.purple,
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            type: BottomNavigationBarType.fixed));
  }
}
