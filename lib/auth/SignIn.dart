import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_test/auth/SignUp.dart';
import 'package:sport_test/auth/reset.dart';
import 'package:sport_test/screens/profile.dart';
import 'package:sport_test/src/NavRouteBar.dart';
import 'package:sport_test/screens/signInpassstate.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
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
            return const SignInScreen();
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.purple, value: 20),
          );
        },
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  static const String route = '/HomePage/SignIn';
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State<SignInScreen> {
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
        const SnackBar(
          content: Text('user not found'),
        );
        print("No user found for that email");
      } else if (e.code == "invalid-email") {
        const SnackBar(
          content: Text('Incorrect email'),
        );
        print("Please enter the correct email");
      } else if (e.code == "wrong-password") {
        const SnackBar(
          content: Text('Incorrect password'),
        );
        print("The password is incorrect");
      }
    }
    return user;
  }

  Future<void> signInWithGoogle() async {
    //create an instance of the firebase auth and google signin
    FirebaseAuth authG = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    //Sign in the user with the credentials

    final UserCredential userCredential =
        await authG.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                  child: Icon(CupertinoIcons.sportscourt,
                      size: 85, color: Colors.purple)),
              // const Text('App ',
              //     textHeightBehavior:
              //         TextHeightBehavior(applyHeightToFirstAscent: true),
              //     style: TextStyle(
              //         color: Colors.purple,
              //         fontSize: 44.0,
              //         fontWeight: FontWeight.bold)),
              // const Text(
              //   'Login',
              //   style: TextStyle(
              //       color: Colors.purple,
              //       fontSize: 28.0,
              //       fontWeight: FontWeight.bold),
              // ),
              const SizedBox(
                height: 25.0,
              ),
              Flexible(
                  child: Form(
                      key: emailKey,
                      child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (emailText) {
                            if (emailText == null || emailText.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              // errorText: '',
                              // errorStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              hintText: 'email address',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 12.0),
                                  child: Icon(Icons.email_outlined,
                                      color: Colors.purple)))))),
              const SizedBox(height: 10.0),
              Flexible(
                  child: Form(
                      key: passwordKey,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        obscureText: passwordVisible,
                        obscuringCharacter: '*',
                        keyboardType: TextInputType.text,
                        validator: (passText) {
                          if (passText == null || passText.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // errorText: 'Please Enter your password',
                          // errorStyle: TextStyle(color: Colors.red),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          hintText: 'password',
                          // focusedBorder: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(14.0),
                          //     borderSide: const BorderSide(color: Colors.black)),
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Padding(
                              padding: EdgeInsetsDirectional.only(start: 15.0),
                              child: Icon(Icons.lock_outline_rounded,
                                  color: Colors.purple)),
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
                      ))),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ResetPage()));
                  if (kDebugMode) {
                    print('changing password');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Forgot password ?",
                      style: TextStyle(color: Colors.lightBlue),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 19.0),
              SizedBox(
                  width: double.infinity,
                  height: 51.0,
                  child: RawMaterialButton(
                    fillColor: Colors.purple,
                    splashColor: const Color.fromARGB(255, 200, 129, 212),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    enableFeedback: true,
                    onPressed: () async {
                      User? user = await loginUsingEmailPassword(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        // pref.setString("UserID", User.user.uid);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignInPass()));
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Or Continue with',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              OutlinedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () async {
                  await signInWithGoogle();
                  if (mounted) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  }
                },
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image:
                                AssetImage('lib/assets/images/google_logo.png'),
                            height: 35.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ])),
              ),
              // SignInButton(
              //   padding: EdgeInsets.only(left: 50, right: 50),
              //   Buttons.Google,
              //   onPressed: () {},
              // ),
              // SizedBox(
              //     width: double.infinity,
              //     height: 51.0,
              //     child: RawMaterialButton(
              //       fillColor: Colors.white,
              //       splashColor: const Color.fromARGB(255, 200, 129, 212),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(50.0)),
              //       enableFeedback: true,
              //       onPressed: () async {},
              //       child: const Text(
              //         'Sign In with Google',
              //         style: TextStyle(
              //             fontSize: 25.0,
              //             fontWeight: FontWeight.normal,
              //             color: Colors.black),
              //       ),
              //     )),
              const SizedBox(height: 5.0),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
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
          )),
    );
  }
}
