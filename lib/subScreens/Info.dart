import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/SettingsScreen.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.purple,
        centerTitle: true,
        leading: BackButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Settings()));
          },
        ),
      ),
    );
  }
}