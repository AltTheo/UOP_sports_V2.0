import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sport_test/screens/activity.dart';
import 'package:sport_test/screens/home_screen.dart';

import '../screens/Services.dart';
import '../screens/setting_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const Service(),
    Activity(),
    const Settings(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          // appBar: AppBar(
          //     title: Text('Bottom NavBar'), backgroundColor: Colors.purple),
          body: IndexedStack(
            index: selectedIndex,
            children: widgetOptions,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: Icon(CupertinoIcons.home),
                  tooltip: 'News Feed',
                  icon: Icon(Ionicons.home_outline),
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
                  activeIcon: Icon(CupertinoIcons.gear_solid),
                  tooltip: 'Settings',
                  icon: Icon(CupertinoIcons.gear),
                  label: 'Settings')
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
          )),
    );
  }
}

//  Widget buildOffstageNavigator(TabItem tabItem) {
//     return Offstage(
//       offstage: currentTab != tabItem,
//       child: TabNavigator(
//         navigatorKey: navigatorKeys[tabItem],
//         tabItem: tabItem,
//       ),
//     );
//   }
// }

