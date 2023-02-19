import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sport_test/redundant%20files/simpleNav.dart';
import 'package:sport_test/screens/HomeScreen.dart';

// ignore: camel_case_types
class verifyScreen extends StatefulWidget {
  const verifyScreen({super.key});

  @override
  State<StatefulWidget> createState() => verifyScreenState();
}

// ignore: camel_case_types
class verifyScreenState extends State<verifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'A Link has been sent to your email',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Center(
                child: Text(
                  'Please click the link to verify your email',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () => user.sendEmailVerification(),
                child: const Text(
                  'Resend email',
                  style: TextStyle(fontSize: 15.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SimpleNav(),
      ));
    }
  }
}
