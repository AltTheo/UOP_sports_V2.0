import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class YourBookings extends StatefulWidget {
  const YourBookings({super.key});

  @override
  State<YourBookings> createState() => _YourBookingsState();
}

class _YourBookingsState extends State<YourBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
      ),
      body: const Center(child: Text('Your bookings')),
    );
  }
}
