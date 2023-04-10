import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/component/member_profile.dart';

class Manage extends StatefulWidget {
  const Manage({super.key});

  @override
  State<Manage> createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  final user = FirebaseAuth.instance.currentUser;
  final photourl = FirebaseAuth.instance.currentUser?.photoURL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Editprofile(photo: '$photourl'),
              TextButton(
                  onPressed: () {},
                  child: const Text('Edit picture',
                      style: TextStyle(color: Colors.purple, fontSize: 20))),
              const Divider(
                thickness: 1,
              ),
              TextField()
            ],
          ),
        ));
  }
}
