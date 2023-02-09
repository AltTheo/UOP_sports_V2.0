import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/auth/SignIn.dart';

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
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter your email address below to reset password ',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                    controller: resetPassEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        // errorText: 'Please enter your Email',
                        // errorStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        hintText: 'email address',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(start: 12.0),
                            child: Icon(Icons.email_outlined,
                                color: Colors.purple)))),
                const SizedBox(height: 43.0),
                SizedBox(
                    width: double.infinity,
                    height: 51.0,
                    child: RawMaterialButton(
                      fillColor: Colors.purple,
                      splashColor: const Color.fromARGB(255, 200, 129, 212),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      enableFeedback: true,
                      onPressed: () {
                        resetPassword(resetPassEmail.text);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      },
                      child: const Text(
                        'Send Request',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
                    const SizedBox(
                      height: 15.0,
                    ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
                    if (kDebugMode) {
                      print('changing password');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Continue to Sign In",
                        style: TextStyle(color: Colors.lightBlue, fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
