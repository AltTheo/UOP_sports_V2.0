import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/authScreen.dart';
import 'package:sport_test/redundant%20files/simpleNav.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const SignInScreen();
        }
        final user = snapshot.data;
        if (user != null) {
          if (kDebugMode) {
            print("user is logged in");
          }
          if (kDebugMode) {
            print(user);
          }
          return const SimpleNav();
        } else {
          if (kDebugMode) {
            print("user is not logged in");
          }
          return const WelcomeScreen();
        }
      },
    );
  }
}
