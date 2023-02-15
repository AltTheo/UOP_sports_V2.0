import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_test/redundant%20files/Nav.dart';
import 'package:sport_test/redundant%20files/simpleNav.dart';
import 'package:sport_test/src/NavRouteBar.dart';

class SignInPass extends StatefulWidget {
  const SignInPass({Key? key}) : super(key: key);

  @override
  State<SignInPass> createState() => SignInPassState();
}

class SignInPassState extends State<SignInPass> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SimpleNav())));
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              CupertinoIcons.sportscourt,
              size: 60.0,
              color: Colors.purple,
            ),
            SizedBox(height: 10.0),
            Text('Signing in ...', style: TextStyle(fontSize: 18),),
            SizedBox(height: 20.0),
            CircularProgressIndicator()
          ],
        )));
  }
}
