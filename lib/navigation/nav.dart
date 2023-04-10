import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sport_test/screens/activity.dart';
import 'package:sport_test/screens/home_screen.dart';
import '../screens/Services.dart';
import '../screens/setting_screen.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<StatefulWidget> createState() => NavState();
}

class NavState extends State<Nav> {
  int selectedIndex = 0;
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
              builder: (BuildContext context) => widgetOptions[selectedIndex],
            );
          },
        ),
        bottomNavigationBar: AnimatedNotchBottomBar(
          notchColor: Colors.white,
          color: Colors.white,

          // ignore: prefer_const_literals_to_create_immutables
          bottomBarItems: [
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.home,
                color: Colors.purpleAccent,
                size: 25,
              ),
              activeItem: Icon(
                Icons.home,
                color: Colors.purple,
                size: 25,
              ),
              itemLabel: 'home',
            ),
            const BottomBarItem(
              inActiveItem: Icon(
                Ionicons.barbell,
                color: Colors.purpleAccent,
                size: 25,
              ),
              activeItem: Icon(
                Ionicons.barbell,
                color: Colors.purple,
                size: 25,
              ),
              itemLabel: 'Bookings',
            ),
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.auto_graph_outlined,
                color: Colors.purpleAccent,
                size: 25,
              ),
              activeItem: Icon(
                Icons.auto_graph_outlined,
                color: Colors.purple,
                size: 25,
              ),
              itemLabel: 'activity',
            ),
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.settings,
                color: Colors.purpleAccent,
                size: 25,
              ),
              activeItem: Icon(
                Icons.settings,
                color: Colors.purple,
                size: 25,
              ),
              itemLabel: 'settings',
            ),
          ],

          onTap: onItemTapped,
          pageController: PageController(initialPage: selectedIndex),
        ));
  }
}
