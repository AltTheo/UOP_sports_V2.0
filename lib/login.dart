import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/screens/registerScreen.dart';
import 'package:sport_test/Nav.dart';
import 'package:sport_test/screens/reset.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
            return const LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  bool passwordVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();

// Login Function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      } else if (e.code == "invalid-email") {
        print("Please enter the correct email");
      } else if (e.code == "wrong-password") {
        print("The password is incorrect");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('App ',
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: true),
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold)),
            const Text(
              'Login',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Form(
                key: emailKey,
                child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (emailText) {
                      if (emailText == null|| emailText.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        // errorText: '',
                        // errorStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0))),
                        hintText: 'email address',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(start: 12.0),
                            child: Icon(Icons.email_rounded,
                                color: Colors.purple))))),
            const SizedBox(height: 34.0),
            Form(
              key: passwordKey,
            child: TextFormField(
              controller: passwordController,
              obscureText: passwordVisible,
              obscuringCharacter: '*',
              keyboardType: TextInputType.text,
              validator: (passText) {
                      if (passText == null|| passText.isEmpty) {
                        return 'PLease enter your password';
                      }
                      return null;
                    },
              decoration: InputDecoration(
                // errorText: 'Please Enter your password',
                // errorStyle: TextStyle(color: Colors.red),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0))),
                hintText: 'password',
                // focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(14.0),
                //     borderSide: const BorderSide(color: Colors.black)),
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.0),
                    child:
                        Icon(Icons.lock_outline_rounded, color: Colors.purple)),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(passwordVisible
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded)),
              ),
            )),
            const SizedBox(
              height: 12.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const ResetPage()));
                if (kDebugMode) {
                  print('changing password');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Forgot password ?",
                    style: TextStyle(color: Colors.lightBlue),
                  )
                ],
              ),
            ),
            const SizedBox(height: 43.0),
            SizedBox(
                width: double.infinity,
                height: 51.0,
                child: RawMaterialButton(
                  fillColor: Colors.purple,
                  splashColor: const Color.fromARGB(255, 200, 129, 212),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  enableFeedback: true,
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                    print(user);
                    if (user != null && !emailKey.currentState!.validate() && !passwordKey.currentState!.validate() ) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Nav()));
                    }
                  },
                  child: const Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const RegPage()));
                if (kDebugMode) {
                  print('Registering new user');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Don't have an account, "),
                  Text(" Register,",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline))
                ],
              ),
            )
          ],
        ));
  }
}
