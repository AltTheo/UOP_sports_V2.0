import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String? fullName;
  final String userEmail;
  // final String userPassword;

  Usermodel(
      {required this.userEmail,
      // required this.userPassword,
      this.fullName});

  Map<String, dynamic> toMap() {
    return {
      'FullName': fullName,
      'UserEmail': userEmail,
      // 'UserPassword': userPassword,
    };
  }

  // Convert a Firestore document to a Booking object
  factory Usermodel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Usermodel(
      fullName: data['FullName'],
      userEmail: data['UserEmail'],
      // userPassword: data['UserPassword'],
    );
  }
}

void addUser(Usermodel user) {
  FirebaseFirestore.instance.collection('Users').add(user.toMap());
}
