import 'package:flutter/material.dart';
import 'package:sport_test/registerScreen.dart';
// import 'package:flutter/cupertino.dart';

import 'login.dart';
// import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'application', home: RegPage());
  }
}


