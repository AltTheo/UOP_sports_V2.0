import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/verifyScreen.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<StatefulWidget> createState() => RegPageState();
}

class RegPageState extends State<RegPage> {
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
            return const Register();
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

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  bool passwordVisible = true;
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();
  GlobalKey<FormState> confirmKey = GlobalKey();

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        print("No user found for that email");
      }
      if (e.code == "weak-password") {
        print("password is weak");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
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
              const Center(
                  child: Icon(CupertinoIcons.sportscourt,
                      size: 85, color: Colors.purple)),
              const Center(
                child: Text('Create an Account',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 30.0,
                        fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Flexible(
                  child: Form(
                key: emailKey,
                child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: newEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      // errorText: 'Please Enter your email address',
                      // errorStyle: TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0))),
                      hintText: 'email Address',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 15.0),
                          child:
                              Icon(Icons.email_outlined, color: Colors.purple)),
                    )),
              )),
              const SizedBox(
                height: 23.0,
              ),
              Flexible(
                  child: Form(
                      key: passwordKey,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: newPasswordController,
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
                          hintText: 'new password',
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
                    onPressed: () async {
                      User? user = await loginUsingEmailPassword(
                          email: newEmailController.text,
                          password: newPasswordController.text,
                          context: context);
                      print(user);
                      // FirebaseAuth result = await
                      if (user != null) {
                        User? user = FirebaseAuth.instance.currentUser;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const verifyScreen()));
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                  if (kDebugMode) {
                    print('Registering new user');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Already have an account?,  "),
                    Text("Login",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            decoration: TextDecoration.underline))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
