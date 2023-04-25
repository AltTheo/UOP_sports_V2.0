import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../screens/your_bookings.dart';

class GymBookingCalendarView extends StatefulWidget {
  const GymBookingCalendarView({Key? key}) : super(key: key);

  @override
  State<GymBookingCalendarView> createState() => _GymBookingCalendarViewState();
}

class _GymBookingCalendarViewState extends State<GymBookingCalendarView> {
  final user = FirebaseAuth.instance.currentUser;
  final now = DateTime.now();
  late BookingService sportBookingService;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    sportBookingService = BookingService(
        userEmail: '${user?.email}',
        userId: '${user?.uid}',
        userName: '${user?.displayName}',
        serviceName: 'Gym session',
        serviceDuration: 15,
        bookingEnd: DateTime(now.year, now.month, now.day, 22, 00),
        bookingStart: DateTime(now.year, now.month, now.day, 6, 30));
  }

  Stream<dynamic>? getBookingStream(
      {required DateTime end, required DateTime start}) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query the "Bookings" collection for bookings between the start and end dates
    return firestore
        .collection('Bookings')
        .where('startTime', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('startTime', isLessThanOrEqualTo: Timestamp.fromDate(end))
        .snapshots();
  }

  Future<dynamic> createBooking({required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      converted.add(DateTimeRange(
          start: newBooking.bookingStart, end: newBooking.bookingEnd));
      addBooking(newBooking);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(15.0),
            dismissDirection: DismissDirection.startToEnd,
            content: Text(
              'The session was successfully booked',
            )),
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => YourBookings()));
      debugPrint('Booking added to database.');
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        behavior: SnackBarBehavior.floating,
        content: Text('The booking was unsuccessful'),
      ));
      debugPrint('Error adding booking to database: $error');
    }

    // print('Booking Saved');
  }

  void addBooking(BookingService newBooking) {
    FirebaseFirestore.instance.collection('Bookings').add(newBooking.toJson());
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResult({required dynamic streamResult}) {
    // Use constant values for testing
    DateTime first = DateTime.now();
    const int intervalInMinutes = 15;
    int rangeCount = 4;

    return List.generate(rangeCount, (index) {
      final start = index == 0
          ? first
          : first.add(Duration(minutes: index * intervalInMinutes));
      final end = start.add(const Duration(minutes: intervalInMinutes));
      return DateTimeRange(start: start, end: end);
    });
  }

  List<DateTimeRange> convertStreamResult2({
    required dynamic streamResult,
    int intervalInMinutes = 60,
    Duration expectedDuration = const Duration(hours: 1),
  }) {
    final DateTime first = DateTime.now();

    final int rangeCount =
        (expectedDuration.inMinutes / intervalInMinutes).ceil();

    return List.generate(rangeCount, (index) {
      final start = index == 0
          ? first
          : first.add(Duration(minutes: index * intervalInMinutes));
      final end = start.add(Duration(minutes: intervalInMinutes));

      return DateTimeRange(start: start, end: end);
    });
  }

  List<DateTimeRange> generatePauseSlots() {
    DateTime now = DateTime.now();
    final openingTime = DateTime(now.year, now.month, now.day, 6, 30);
    final startPause = openingTime;
    final endPause = now.subtract(const Duration(minutes: 15));
    return [
      DateTimeRange(start: startPause, end: endPause),
    ];
  }

  CollectionReference bookings =
      FirebaseFirestore.instance.collection('Bookings');

  ///This is how can you get the reference to your data from the collection, and serialize the data with the help of the Firestore [withConverter]. This function would be in your repository.
  CollectionReference<BookingService> getBookingStreamFirestore() {
    return bookings.doc().collection('Bookings').withConverter<BookingService>(
          fromFirestore: (snapshots, _) =>
              BookingService.fromJson(snapshots.data()!),
          toFirestore: (snapshots, _) => snapshots.toJson(),
        );
  }

  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.purple,
        automaticallyImplyLeading: true,
        title: const Text('Choose a time slot'),
      ),
      body: Center(
        child: BookingCalendar(
          bookingExplanation: const Text(
            'Select a time below',
            style: TextStyle(fontSize: 25),
          ),
          bookingService: sportBookingService,
          convertStreamResultToDateTimeRanges: convertStreamResult2,
          getBookingStream: getBookingStream,
          uploadBooking: createBooking,
          hideBreakTime: true,
          loadingWidget: const Text('Fetching data...'),
          uploadingWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Please wait',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: LinearProgressIndicator(),
              ),
            ],
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          locale: "en",
          gridScrollPhysics:
              const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          availableSlotText: 'available',
          availableSlotColor: Colors.green[200],
          selectedSlotText: '',
          selectedSlotColor: Colors.orangeAccent,
          bookedSlotText: '',
          bookedSlotColor: Colors.red[300],
          pauseSlotColor: Colors.grey,
          bookingGridCrossAxisCount: 4,
          bookingGridChildAspectRatio: 600 / 550,
          wholeDayIsBookedWidget:
              const Text('Sorry, There are no available slots'),
          pauseSlots: generatePauseSlots(),
          formatDateTime: formatDateTime,
          // disabledDays: const [6, 7],
        ),
      ),
    );
  }
}
