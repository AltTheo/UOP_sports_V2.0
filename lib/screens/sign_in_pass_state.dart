import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/navigation/bottom_nav.dart';

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
            MaterialPageRoute(builder: (context) => const BottomNavBar())));
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.sportscourt,
              size: 60.0,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Signing in ...',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: LinearProgressIndicator(),
            )
          ],
        )));
  }
}
