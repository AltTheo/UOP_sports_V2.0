import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.purple,
        enableFeedback: true,
        tooltip: 'Make a booking',
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
