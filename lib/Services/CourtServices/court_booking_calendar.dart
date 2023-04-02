import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class CourtBookingCalendarView extends StatefulWidget {
  const CourtBookingCalendarView({Key? key}) : super(key: key);

  @override
  State<CourtBookingCalendarView> createState() =>
      _CourtBookingCalendarViewState();
}

class _CourtBookingCalendarViewState extends State<CourtBookingCalendarView> {
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
        userName: '${user?.displayName}',
        serviceName: 'Sports Booking',
        serviceDuration: 60,
        bookingEnd: DateTime(now.year, now.month, now.day, 22, 00),
        bookingStart: DateTime(now.year, now.month, now.day, 6, 30));
  }

  Stream<dynamic>? getBookingStream(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBooking({required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 3));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    if (kDebugMode) {
      print('${newBooking.toJson()} has been uploaded');
    }
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
            backgroundColor: Colors.purple,
            elevation: 15.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(15.0),
            dismissDirection: DismissDirection.startToEnd,
            behavior: SnackBarBehavior.floating,
            content: Text(
              'The session was successfully booked',
              style: TextStyle(fontSize: 18),
            )),
      );
      if (kDebugMode) {
        print('Booking added to database.');
      }
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        behavior: SnackBarBehavior.floating,
        content: Text('The booking was unsuccessful'),
      ));
      if (kDebugMode) {
        print('Error adding booking to database: $error');
      }
    }
    // print('Booking Saved');
  }

  void addBooking(BookingService newBooking) {
    FirebaseFirestore.instance.collection('Bookings').add(newBooking.toJson());
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResult({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    DateTime first = now;
    // DateTime second = now.add(const Duration(minutes: 15));
    // DateTime third = now.add(const Duration(minutes: 15));
    // DateTime fourth = now.add(const Duration(minutes: 15));
    // converted.add(
    //     DateTimeRange(start: first, end: now.add(const Duration(minutes: 15))));
    // converted.add(DateTimeRange(
    //     start: second, end: second.add(const Duration(minutes: 15))));
    // converted.add(DateTimeRange(
    //     start: third, end: third.add(const Duration(minutes: 15))));
    // converted.add(DateTimeRange(
    //     start: fourth, end: fourth.add(const Duration(minutes: 15))));
    return converted;
  }

  // List<DateTimeRange> generatePauseSlots() {
  //   return [
  //     DateTimeRange(
  //         start: DateTime(now.year, now.month, now.day, 12, 0),
  //         end: DateTime(now.year, now.month, now.day, 15, 0))
  //   ];
  // }

  //  String Function(DateTime) formatDateTime = (dateTime) {
  //   return DateFormat().format(dateTime);
  // };

  //  static String formatDateTime1(DateTime dt) {
  //   return DateFormat.Hm().format(dt);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: true,
        title: const Text('Book a slot'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/images/white_3.png'))),
        child: Center(
          child: BookingCalendar(
            bookingService: sportBookingService,
            convertStreamResultToDateTimeRanges: convertStreamResult,
            getBookingStream: getBookingStream,
            uploadBooking: createBooking,
            hideBreakTime: true,
            loadingWidget: const Text('Fetching data...'),
            uploadingWidget: Column(
              children: const [
                Text('Please wait'),
                CircularProgressIndicator(color: Colors.purple),
              ],
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            locale: "en",
            gridScrollPhysics:
                const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            availableSlotText: 'Available',
            selectedSlotText: 'Selected',
            bookedSlotText: 'Booked',
            // pauseSlotColor: Colors.grey,
            bookingGridCrossAxisCount: 4,
            bookingGridChildAspectRatio: 350 / 420,
            wholeDayIsBookedWidget:
                const Text('Sorry, There are no available slots'),
            // formatDateTime: formatDateTime1(),
            // disabledDays: const [6, 7],
          ),
        ),
      ),
    );
  }
}
