import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.purple,
        ),
        drawer: const Drawer(
          backgroundColor: Color.fromARGB(255, 217, 113, 236),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            children:  [
              RawMaterialButton(
                fillColor: Colors.purple,
                child: const Text('hello'),
                onPressed: (){})
            ]));
  }
}
