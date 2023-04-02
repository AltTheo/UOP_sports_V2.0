import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   static const String route = '/';
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         centerTitle: true,
//         backgroundColor: Colors.purple,
//       ),
//       drawer: const Drawer(
//         semanticLabel: 'Dashboard',
//       ),
//     );
//   }
// }

const Color mediumPurple = Color.fromRGBO(79, 0, 241, 1.0);
const String placeHolderText = 'Some news about sports from the university.';

class HomeOne extends StatefulWidget {
  const HomeOne({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<HomeOne> createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      drawer: const Drawer(
        backgroundColor: Colors.white12,
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/white_3.png'))),
          child: const SizedBox()),
    );
  }
}
