import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sport_test/auth/reset.dart';
import 'package:sport_test/auth/sign_up.dart';
import 'package:sport_test/screens/sign_In_pass_state.dart';
import '../redundant files/bottom_nav.dart';
import 'auth_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  // Initialize the firebase app

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const WelcomeScreen();
        }
        final user = snapshot.data;
        if (user != null) {
          debugPrint("user is logged in");
          debugPrint('$user');
          return const BottomNavBar();
        } else {
          debugPrint("user is not logged in");
          return const WelcomeScreen();
        }
      },
    );
  }
}

class SignInScreen extends StatefulWidget {
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

  //Snackbar
  snackbar(String data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(data),
        dismissDirection: DismissDirection.startToEnd,
        duration: const Duration(seconds: 2),
      ),
    );
  }

// Login Function
  Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (email.isEmpty || !EmailValidator.validate(email)) {
      snackbar('Please enter a valid email');
      return null;
    }
    if (password.length < 8) {
      snackbar('Password must be at least 8 characters long');
      return null;
    }
    if (password.isEmpty) {
      snackbar('Please enter your password');
      return null;
    }
    User? user;
    try {
      // Perform the Sign in operation.
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          snackbar('User not found');
          debugPrint("No user found for that email");
          break;
        case 'invalid-email':
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid email')),
          );
          debugPrint("Please enter the correct email");
          break;

        case 'wrong-password':
          snackbar('Incorrect password');
          debugPrint("The password is incorrect");
          break;
        // Handle other Firebase Auth exceptions here
        default:
          snackbar('An unknown error occurred');
          debugPrint("An unknown error occurred.");
      }
    } finally {
      // Perform any required actions after the Sign in operation, such as hiding a loading spinner.
    }
    return user;
  }

//google sign in fucntion
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

//Login fucntion
  login() async {
    User? user = await loginUsingEmailPassword(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    debugPrint('$user');
    if (user != null && mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SignInPass()));
    }
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Center(
                //     child: Icon(CupertinoIcons.sportscourt,
                //         size: 65, color: Colors.purple)),
                Text(
                  'Welcome back',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Form(
                    key: emailKey,
                    child: TextFormField(
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
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintText: 'Email address',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5.0),
                                child: Icon(
                                  CupertinoIcons.mail,
                                  color: Theme.of(context).colorScheme.primary,
                                ))))),
                const SizedBox(height: 15.0),
                Form(
                    key: passwordKey,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.done,
                      controller: passwordController,
                      obscureText: passwordVisible,
                      obscuringCharacter: '•',
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value) {
                        bool isEmailValid = emailKey.currentState!.validate();
                        bool isPasswordValid =
                            passwordKey.currentState!.validate();
                        if (isEmailValid && isPasswordValid) {
                          login();
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Minimum of 8 characters Required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 5.0),
                            child: Icon(CupertinoIcons.lock,
                                color: Theme.of(context).colorScheme.primary)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ResetPage()));
                        debugPrint('changing password');
                      },
                      child: const Text('Forgot password?',
                          style: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
                // const SizedBox(height: 8.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(380, 55)),
                  onPressed: () async {
                    bool isEmailValid = emailKey.currentState!.validate();
                    bool isPasswordValid = passwordKey.currentState!.validate();
                    if (isEmailValid && isPasswordValid) {
                      login();
                    }
                  },
                  child: const Text(
                    'Continue',
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
                      "Don't have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUp()));
                      },
                      child:
                          const Text('Sign up', style: TextStyle(fontSize: 15)),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInPass()));
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
                // const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
