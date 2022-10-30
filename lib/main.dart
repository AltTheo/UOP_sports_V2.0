import 'package:flutter/material.dart';
import 'package:sport_test/Nav.dart';
import 'package:sport_test/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:flutter/cupertino.dart';

// import 'login.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'application', home: HomePage());
  }
}


