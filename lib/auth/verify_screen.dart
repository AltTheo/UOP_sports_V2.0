import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../redundant files/bottom_nav.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<StatefulWidget> createState() => VerifyScreenState();
}

class VerifyScreenState extends State<VerifyScreen> {
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
    if (user.emailVerified && mounted) {
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const BottomNavBar(),
      ));
    }
  }
}
