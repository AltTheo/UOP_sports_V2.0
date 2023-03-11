import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  final String username;
  final String bookingInfo;
  final DateTime dateTime;

  Booking(
      {required this.username,
      required this.bookingInfo,
      required this.dateTime});

  // Convert a Booking object to a Map (Firestore document)
  Map<String, dynamic> toMap() {
    return {
      'Username': username,
      'BookingInfo': bookingInfo,
      'Datetime' : dateTime
    };
  }

  // Convert a Firestore document to a Booking object
  factory Booking.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Booking(
      username: data['Username'],
      bookingInfo: data['BookingInfo'],
      dateTime: data['DateTime'],
    );
  }

  toJson() {
    return {
      "Username": username,
      "BookingInfo": bookingInfo,
      "DateTime": dateTime,
    };  
  }
}

// Add a new Booking document to Firestore
void addBooking(Booking booking) {
  FirebaseFirestore.instance.collection('bookings').doc().set(booking.toMap());
}

// Get all Booking documents from Firestore
Stream<List<Booking>> getBookings() {
  return FirebaseFirestore.instance.collection('bookings').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => Booking.fromFirestore(doc)).toList());
}
