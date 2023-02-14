import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/SignUp.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.sportscourt,
            size: 60.0,
            color: Colors.purple,
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Welcome to Sports App',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            'Log in with your account to continue',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(90, 40)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(90, 40)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
