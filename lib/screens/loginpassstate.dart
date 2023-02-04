import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_test/redundant%20files/Nav.dart';
import 'package:sport_test/src/NavRouteBar.dart';

class LoginPass extends StatefulWidget {
  const LoginPass({Key? key}) : super(key: key);

  @override
  State<LoginPass> createState() => LoginPassState();
}

class LoginPassState extends State<LoginPass> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Nav())));
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children:  [
          const Center(
              child: Icon(CupertinoIcons.sportscourt,
                  size: 65, color: Colors.purple)),
          const Text('Logging in',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                  color: Colors.purple,
                  fontWeight: FontWeight.w900)),
          const SizedBox(
            height: 50,
          ),
          const CircularProgressIndicator(color: Colors.purple)
        ],
      ))),
    );
  }
}
