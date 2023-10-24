import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/auth/sign_in.dart';
import 'package:sport_test/auth/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 243, 241, 241),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.sportscourt,
                size: 150.0,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Welcome to Sports App',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'Log in with your account to continue',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(110, 45)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(110, 45)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
