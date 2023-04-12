import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sport_test/auth/sign_in.dart';

Future<void> main() async {
  Logger.root.level = Level.ALL; // set the root logger level
  Logger.root.onRecord.listen((record) {
    // listen to all logs
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final List<Color> colors = [Colors.purple, Colors.orange, Colors.teal];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeAnimationCurve: Curves.bounceIn,
        debugShowCheckedModeBanner: false,
        title: 'Sports App',
        theme: ThemeData(
            brightness: Brightness.light,
            // scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
            snackBarTheme: const SnackBarThemeData(
              backgroundColor: Color.fromARGB(255, 126, 125, 125),
              contentTextStyle: TextStyle(fontSize: 17),
              elevation: 150.0,
              behavior: SnackBarBehavior.floating,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromARGB(255, 244, 244, 244),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color.fromARGB(255, 29, 2, 36),
                enableFeedback: false,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: Colors.black,
                landscapeLayout: BottomNavigationBarLandscapeLayout.spread),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            }),
            fontFamily: 'Ubuntu',
            appBarTheme: const AppBarTheme(
                scrolledUnderElevation: 5.0,
                color: Color.fromARGB(255, 244, 244, 244),
                actionsIconTheme: IconThemeData(size: 30, color: Color.fromARGB(255, 29, 2, 36)),
                iconTheme: IconThemeData(size: 30, color: Color.fromARGB(255, 29, 2, 36)),
                centerTitle: false,
                elevation: 0,
                titleTextStyle: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                    color: Color.fromARGB(255, 29, 2, 36))),
            useMaterial3: true,
            colorSchemeSeed: const Color.fromARGB(255, 54, 3, 65)
            // primarySwatch: Colors.purple,
            ),
        darkTheme: ThemeData(
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: Color.fromARGB(255, 126, 125, 125),
            contentTextStyle: TextStyle(fontSize: 17),
            elevation: 150.0,
            behavior: SnackBarBehavior.floating,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              enableFeedback: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.white,
              landscapeLayout: BottomNavigationBarLandscapeLayout.spread),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
          fontFamily: 'Ubuntu',
          appBarTheme: const AppBarTheme(
              scrolledUnderElevation: 5.0,
              actionsIconTheme: IconThemeData(size: 30, color: Colors.white),
              iconTheme: IconThemeData(size: 30, color: Colors.white),
              centerTitle: false,
              elevation: 0,
              titleTextStyle: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  color: Colors.white)),
          useMaterial3: true,
          colorSchemeSeed: Color.fromARGB(255, 211, 168, 218),
          // primarySwatch: Colors.purple,
          brightness: Brightness.dark,
        ),
        home: const SignInPage());
    // home: const NavbarSample(title: 'BottomNavbar Demo'));
  }
}

//this is used to navigate pages
class ProfileEdit extends StatelessWidget {
  static const String route = '/profile/edit';

  const ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Edit')),
      body: const Center(
        child: Text('Notice this page does not have bottom navigation bar'),
      ),
    );
  }
}
