// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sport_test/screens/Activity.dart';
// import 'package:sport_test/screens/HomeScreen.dart';

// import '../screens/SettingsScreen.dart';
// import '../screens/BookingScreen.dart';

// class Nav extends StatefulWidget {
//   const Nav({super.key});

//   @override
//   State<StatefulWidget> createState() => NavState();
// }

// class NavState extends State<Nav> {
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
//         bottomNavigationBar: AnimatedNotchBottomBar(
//           notchColor: Colors.white,
//           color: Colors.white,

//           // ignore: prefer_const_literals_to_create_immutables
//           bottomBarItems: [
//             const BottomBarItem(
//               inActiveItem: Icon(
//                 Icons.dashboard_outlined,
//                 color: Colors.purpleAccent,
//                 size: 25,
//               ),
//               activeItem: Icon(
//                 Icons.dashboard_outlined,
//                 color: Colors.purple,
//                 size: 25,
//               ),
//               itemLabel: 'home',
//             ),
//             const BottomBarItem(
//               inActiveItem: Icon(
//                 Icons.timer_outlined,
//                 color: Colors.purpleAccent,
//                 size: 25,
//               ),
//               activeItem: Icon(
//                 Icons.timer_outlined,
//                 color: Colors.purple,
//                 size: 25,
//               ),
//               itemLabel: 'Bookings',
//             ),
//             const BottomBarItem(
//               inActiveItem: Icon(
//                 Icons.auto_graph_outlined,
//                 color: Colors.purpleAccent,
//                 size: 25,
//               ),
//               activeItem: Icon(
//                 Icons.auto_graph_outlined,
//                 color: Colors.purple,
//                 size: 25,
//               ),
//               itemLabel: 'activity',
//             ),
//             const BottomBarItem(
//               inActiveItem: Icon(
//                 Icons.settings,
//                 color: Colors.purpleAccent,
//                 size: 25,
//               ),
//               activeItem: Icon(
//                 Icons.settings,
//                 color: Colors.purple,
//                 size: 25,
//               ),
//               itemLabel: 'settings',
//             ),
//           ],

//           onTap: onItemTapped,
//           pageController: PageController(initialPage: selectedIndex),
//         ));
//   }
// }



// void main() {
//   runApp(MyApp());
// }


// SettingsGroup(
//               settingsGroupTitle: "Account",
//               items: [
//                 SettingsItem(
//                   icons: CupertinoIcons.person,
//                   iconStyle: IconStyle(
//                       // backgroundColor: Colors.purple,
//                       withBackground: true,
//                       iconsColor: Colors.white),
//                   onTap: () {
//                     NavbarNotifier.hideBottomNavBar = false;
//                     navigate(
//                       context,
//                       Info.route,
//                       isRootNavigator: false,
//                     );
//                   },
//                   title: 'Member Info',
//                   titleStyle: const TextStyle(fontSize: 17),
//                   subtitle: 'manage your membership',
//                   subtitleStyle: const TextStyle(fontSize: 15),
//                 ),
//                 SettingsItem(
//                   onTap: () {
//                     _showAction(context);
//                   },
//                   icons: Icons.exit_to_app_outlined,
//                   iconStyle: IconStyle(
//                       // backgroundColor: Colors.purple,
//                       withBackground: true,
//                       iconsColor: Colors.white),
//                   title: "Sign Out",
//                   titleStyle: const TextStyle(fontSize: 17),
//                 ),
//               ],
//             ),
//             SettingsGroup(
//               settingsGroupTitle: 'App preferences',
//               items: [
//                 SettingsItem(
//                   onTap: () {},
//                   icons: Icons.edit,
//                   iconStyle: IconStyle(
//                     iconsColor: Colors.white,
//                     withBackground: true,
//                     // backgroundColor: Colors.purple
//                   ),
//                   title: 'Appearance',
//                   titleStyle: const TextStyle(fontSize: 17),
//                   subtitle: "Make the App yours",
//                   subtitleStyle: const TextStyle(fontSize: 15),
//                 ),
//                 SettingsItem(
//                   onTap: () {},
//                   icons: CupertinoIcons.lock_shield_fill,
//                   iconStyle: IconStyle(
//                     iconsColor: Colors.white,
//                     withBackground: true,
//                     // backgroundColor: Colors.purple,
//                   ),
//                   title: 'Privacy',
//                   titleStyle: const TextStyle(fontSize: 17),
//                 ),
//                 SettingsItem(
//                   onTap: () {},
//                   icons: Icons.dark_mode_rounded,
//                   iconStyle: IconStyle(
//                     iconsColor: Colors.white,
//                     withBackground: true,
//                     // backgroundColor: Colors.purple,
//                   ),
//                   title: 'Dark mode',
//                   titleStyle: const TextStyle(fontSize: 17),
//                   subtitle: "Automatic",
//                   subtitleStyle: const TextStyle(fontSize: 15),
//                   trailing: Switch.adaptive(
//                     value: false,
//                     onChanged: (value) {
//                       setState() {
//                         isSwitched = value;
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SettingsGroup(
//               settingsGroupTitle: 'Privacy',
//               items: [
//                 SettingsItem(
//                   onTap: () {},
//                   icons: Icons.info_rounded,
//                   iconStyle: IconStyle(
//                       // backgroundColor: Colors.purple,
//                       ),
//                   title: 'About',
//                   titleStyle: const TextStyle(fontSize: 17),
//                   subtitle: "Learn more about the App",
//                   subtitleStyle: const TextStyle(fontSize: 15),
//                 ),
//                 SettingsItem(icons: Icons.g_mobiledata, title: 'title', onTap: (){}),
//               ],
//             ),