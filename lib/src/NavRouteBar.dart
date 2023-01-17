import 'package:flutter/material.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:sport_test/screens/Activity.dart';
import 'package:sport_test/src/login.dart';
import 'package:sport_test/src/main.dart';

import '../screens/BookingScreen.dart';
import '../screens/HomeScreen.dart';
import '../screens/SettingsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NavbarItem> items = [
    NavbarItem(Icons.home, 'Home', backgroundColor: colors[0]),
    NavbarItem(Icons.timer_outlined, 'Booking', backgroundColor: colors[1]),
    NavbarItem(Icons.auto_graph_outlined, 'Activity', backgroundColor: colors[2]),
    NavbarItem(Icons.settings, 'Settings', backgroundColor: colors[0]),
  ];

  final Map<int, Map<String, Widget>> _routes = const {
    0: {
      '/': HomeScreen(),
      // FeedDetail.route: FeedDetail(),
    },
    1: {
      '/': BookingScreen(),
      BookingCalendarView.route: BookingCalendarView(),
      // ProductComments.route: ProductComments(),
    },
    2: {
      '/': Activity(),
      ProfileEdit.route: ProfileEdit(),
    },
    3: {
      '/': Settings(),
      Info.route : Info(),
      About.route: About(),
      LoginScreen.route: LoginScreen()
    },
  };

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.only(
            bottom: kBottomNavigationBarHeight, right: 2, left: 2),
        content: Text('Tap back button again to exit'),
      ),
    );
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  DateTime oldTime = DateTime.now();
  DateTime newTime = DateTime.now();

  /// This is only for demo purposes
  void simulateTabChange() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      for (int i = 0; i < items.length * 2; i++) {
        NavbarNotifier.index = i % items.length;
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // simulateTabChange();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 24.0),
      //   child: FloatingActionButton(
      //     child: Icon(NavbarNotifier.isNavbarHidden
      //         ? Icons.toggle_off
      //         : Icons.toggle_on),
      //     onPressed: () {
      //       // Programmatically toggle the Navbar visibility
      //       if (NavbarNotifier.isNavbarHidden) {
      //         NavbarNotifier.hideBottomNavBar = false;
      //       } else {
      //         NavbarNotifier.hideBottomNavBar = true;
      //       }
      //       setState(() {});
      //     },
      //   ),
      // ),
      body: NavbarRouter(
        errorBuilder: (context) {
          return const Center(child: Text('Error 404 - Page not found'));
        },
        isDesktop: size.width > 600 ? true : false,
        onBackButtonPressed: (isExitingApp) {
          if (isExitingApp) {
            newTime = DateTime.now();
            int difference = newTime.difference(oldTime).inMilliseconds;
            oldTime = newTime;
            if (difference < 1000) {
              hideSnackBar();
              return isExitingApp;
            } else {
              showSnackBar();
              return false;
            }
          } else {
            return isExitingApp;
          }
        },
        initialIndex: 0,
        type: NavbarType.notched,
        destinationAnimationCurve: Curves.fastOutSlowIn,
        destinationAnimationDuration: 500,
        decoration: NotchedDecoration(
          elevation: 10.0,
            // selectedLabelTextStyle: const TextStyle(color: Colors.red),
            showUnselectedLabels: true,
            unselectedIconColor: Colors.white,
            unselectedItemColor: Colors.white,
            unselectedLabelTextStyle:
                const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            // isExtended: size.width > 800 ? true : false,
            // navbarType: BottomNavigationBarType.shifting
            ),
        onChanged: (x) {},
        backButtonBehavior: BackButtonBehavior.rememberHistory,
        destinations: [
          for (int i = 0; i < items.length; i++)
            DestinationRouter(
              navbarItem: items[i],
              destinations: [
                for (int j = 0; j < _routes[i]!.keys.length; j++)
                  Destination(
                    route: _routes[i]!.keys.elementAt(j),
                    widget: _routes[i]!.values.elementAt(j),
                  ),
              ],
              initialRoute: _routes[i]!.keys.first,
            ),
        ],
      ),
    );
  }
}