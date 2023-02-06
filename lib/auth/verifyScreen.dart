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
      body: const AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          icon: Icon(CupertinoIcons.check_mark_circled),
          iconColor: Colors.purple,
          title: Text('Verfication Link has been sent to your email'),
          content: Text(
              'Please click the Link that has just been sent to your email account \n to verify your email and finish the registration process')),
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
