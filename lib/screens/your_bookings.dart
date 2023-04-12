import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/component/list_bookings.dart';

class YourBookings extends StatelessWidget {
  final Stream<QuerySnapshot> collectionStream;

  YourBookings({Key? key})
      : collectionStream = FirebaseFirestore.instance
            .collection('Bookings')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .orderBy('bookingStart', descending: true)
            .snapshots(),
        super(key: key);

  Widget _buildList(BuildContext context, QuerySnapshot snapshot) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your bookings'),
        ),
        body: ListView.builder(
              itemCount: snapshot.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = snapshot.docs[index];
                // Extract data from documentSnapshot and use it to build your UI
                return Bookingitem(
                  title: documentSnapshot['serviceName'],
                  subtitle: documentSnapshot['bookingStart'],
                  onTap: () {},
                );
              },
            ));
  }

  Widget _buildError(BuildContext context, Object error) {
    return Center(child: Text('Error: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: collectionStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return _buildError(context, snapshot.error!);
        } else if (snapshot.hasData) {
          return _buildList(context, snapshot.data!);
        } else {
          return const NoBookings();
        }
      },
    );
  }
}

class NoBookings extends StatelessWidget {
  const NoBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
      ),
      body: const Center(child: Text('Your bookings will show here')),
    );
  }
}
