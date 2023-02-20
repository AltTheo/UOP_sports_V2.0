import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  static const String route = '/';
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Activity'),
          backgroundColor: Colors.purple,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/white_1.png'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ));
  }
}
