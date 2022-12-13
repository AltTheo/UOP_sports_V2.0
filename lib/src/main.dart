import 'package:flutter/material.dart';
import 'package:sport_test/src/Nav.dart';
import 'package:sport_test/src/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../screens/BookingScreen.dart';
// import 'package:flutter/cupertino.dart';

// import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'application',
        home: const Nav(),
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ));
  }
}
