import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/auth/sign_in.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<StatefulWidget> createState() => ResetState();
}

class ResetState extends State<ResetPage> {
  // Initialize the firebase app

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const ResetScreen();
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
              strokeWidth: 2.0,
            ),
          );
        },
      ),
    );
  }
}

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<StatefulWidget> createState() => ResetScreenState();
}

class ResetScreenState extends State<ResetScreen> {
  final auth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController resetPassEmail = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Reset your password',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Center(
              child: Text(
                'Please enter your email address \n below to reset password',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 30.0),
            TextFormField(
                controller: resetPassEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email';
                  }

                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 12.0),
                        child: Icon(
                          Icons.email_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        )))),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInPage()));
                    if (kDebugMode) {
                      print('changing password');
                    }
                  },
                  child: const Text('Continue to Log in',
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(380, 55),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () async {
                if (resetPassEmail.toString().isNotEmpty) {
                  await resetPassword(resetPassEmail.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        elevation: 15.0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        duration: const Duration(seconds: 1),
                        padding: const EdgeInsets.all(15.0),
                        dismissDirection: DismissDirection.startToEnd,
                        behavior: SnackBarBehavior.floating,
                        content: const Text(
                          'The session was successfully booked',
                          style: TextStyle(fontSize: 18),
                        )),
                  );
                }
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => const SignInPage()));
              },
              child: const Text(
                'Send request',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not received?,',
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    resetPassword(resetPassEmail.text);
                    if (kDebugMode) {
                      print('Resending email');
                    }
                  },
                  child: const Text('resend email',
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 15.0,
            // ),
          ],
        ),
      ),
    );
  }
}
