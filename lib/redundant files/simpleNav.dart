// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sport_test/screens/Activity.dart';
// import 'package:sport_test/screens/HomeScreen.dart';

// import '../screens/SettingsScreen.dart';
// import '../screens/BookingScreen.dart';

// class SimpleNav extends StatefulWidget {
//   const SimpleNav({super.key});

//   @override
//   State<StatefulWidget> createState() => SimpleNavState();
// }

// class SimpleNavState extends State<SimpleNav> {
//   int selectedIndex = 1;
//   List<Widget> widgetOptions = <Widget>[
//     const HomeScreen(),
//     const BookingScreen(),
//     const Activity(),
//     const Settings(),
//   ];

//   void onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //     title: Text('Bottom NavBar'), backgroundColor: Colors.purple),
//         body: Center(child: widgetOptions.elementAt(selectedIndex)),
//         bottomNavigationBar: BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.dashboard_outlined), label: 'home'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.timer_outlined), label: 'Bookings'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.auto_graph_rounded), label: 'Activity'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.settings), label: 'Settings')
//             ],
//             currentIndex: selectedIndex,
//             onTap: onItemTapped,
//             fixedColor: Colors.purple,
//             landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
//             type: BottomNavigationBarType.fixed));
//   }
// }




// class InfoRoute extends CupertinoPageRoute {
// //   InfoRoute() : super(builder: (BuildContext context) => const Info());

// //   // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
// //   @override
// //   Widget buildPage(BuildContext context, Animation<double> animation,
// //       Animation<double> secondaryAnimation) {
// //     return FadeTransition(opacity: animation, child: const Info());
// //   }
// // }