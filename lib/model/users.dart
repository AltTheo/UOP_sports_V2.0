import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Usermodel {
  final String userName;
  final String userEmail;
  final String userId;
  final String photoURL;

  Usermodel(
      {required this.photoURL,
      required this.userEmail,
      required this.userId,
      required this.userName});

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userId': userId,
      'photoURL': photoURL,
    };
  }

  // Convert a Firestore document to a user object
  factory Usermodel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Usermodel(
      userName: data['userName'],
      userEmail: data['userEmail'],
      userId: data['userId'],
      photoURL: data['photoUrl']
    );
  }
}

void addUser(Usermodel user) {
  FirebaseFirestore.instance.collection('Users').add(user.toMap());
}

Future<void> addUser2(Usermodel user) async {
  User fireUser = FirebaseAuth.instance.currentUser!;
  QuerySnapshot isFound = await FirebaseFirestore.instance
      .collection('Users')
      .where('userName', isEqualTo: '${fireUser.displayName}')
      .where('userEmail', isEqualTo: '${fireUser.email}')
      .get();
  // If the user doesn't exist, add them to the database
  if (isFound.docs.isEmpty) {
    await FirebaseFirestore.instance.collection('Users').add(user.toMap());
  } else {
    debugPrint('User already exists in the database');
  }
}
