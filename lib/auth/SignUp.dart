import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/verifyScreen.dart';
import 'package:sport_test/model/users.dart';
import 'package:sport_test/screens/signInpassstate.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  // Initialize the firebase app

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
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
  TextEditingController userNameController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();
  GlobalKey<FormState> userKey = GlobalKey();

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //Register to the firebase account
  register() async {
    final navigator = Navigator.of(context);
    final scaffold = ScaffoldMessenger.of(context);
    User? user = await loginUsingEmailPassword(
        email: newEmailController.text,
        password: newPasswordController.text,
        context: context);
    // ignore: deprecated_member_use
    await FirebaseAuth.instance.currentUser
        ?.updateDisplayName(userNameController.text);
    if (kDebugMode) {
      print(user);
    }
    // FirebaseAuth result = await
    if (newEmailController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        userNameController.text.isEmpty) {
      scaffold.showSnackBar(
        const SnackBar(
            elevation: 15.0,
            duration: Duration(seconds: 2),
            // padding: EdgeInsets.all(15.0),
            dismissDirection: DismissDirection.startToEnd,
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Please fill the fields above',
              style: TextStyle(fontSize: 15),
            )),
      );
    }
    if (user != null && mounted) {
      User user = FirebaseAuth.instance.currentUser!;
      Usermodel newUser = Usermodel(
        userEmail: '${user.email}',
        fullName: userNameController.text,
      );
      addUser(newUser);
      navigator.pushReplacement(
          MaterialPageRoute(builder: (context) => const SignInPass()));
    }
  }

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
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsetsDirectional.only(top: 120.0),
        physics: const ScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('Create your account',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Form(
                    key: userKey,
                    child: TextFormField(
                        focusNode: nameFocus,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        controller: userNameController,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          fieldFocusChange(context, nameFocus, emailFocus);
                        },
                        decoration: InputDecoration(
                          // errorText: 'Please Enter your email address',
                          // errorStyle: TextStyle(color: Colors.red),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          hintText: 'Full name',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 5.0),
                              child: Icon(
                                CupertinoIcons.person,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        ))),
                const SizedBox(
                  height: 15.0,
                ),
                Form(
                  key: emailKey,
                  child: TextFormField(
                      focusNode: emailFocus,
                      textInputAction: TextInputAction.next,
                      controller: newEmailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        fieldFocusChange(context, emailFocus, passwordFocus);
                      },
                      decoration: InputDecoration(
                        // errorText: 'Please Enter your email address',
                        // errorStyle: TextStyle(color: Colors.red),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        hintText: 'Email address',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 5.0),
                            child: Icon(
                              CupertinoIcons.mail,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                      )),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Form(
                    key: passwordKey,
                    child: TextFormField(
                      focusNode: passwordFocus,
                      textInputAction: TextInputAction.done,
                      controller: newPasswordController,
                      obscureText: passwordVisible,
                      obscuringCharacter: '*',
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value) {
                        passwordFocus.unfocus();
                        register();
                      },
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
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        hintText: 'new password',
                        // focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(14.0),
                        //     borderSide: const BorderSide(color: Colors.black)),
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 5.0),
                            child: Icon(
                              CupertinoIcons.lock,
                              color: Theme.of(context).colorScheme.primary,
                            )),
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
                const SizedBox(height: 30.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(380, 55)),
                  onPressed: register,
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                      },
                      child:
                          const Text('Log in', style: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('OR'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 5.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(380, 55),
                        backgroundColor: Colors.white),
                    onPressed: () async {
                      await signInWithGoogle();
                      if (mounted) {
                        User user = FirebaseAuth.instance.currentUser!;
                        Usermodel newUser = Usermodel(
                            userEmail: '${user.email}',
                            fullName: '${user.displayName}');
                        addUser(newUser);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const verifyScreen()));
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Image.asset(
                            'lib/assets/images/google_logo.png',
                            height: 30,
                          ),
                        ),
                        const Text(
                          'Continue With Google',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 24, 23, 23),
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
