import 'package:booking_calendar/booking_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class BookingCalendarView extends StatefulWidget {
  const BookingCalendarView({Key? key}) : super(key: key);

  @override
  State<BookingCalendarView> createState() => _BookingCalendarViewState();
}

class _BookingCalendarViewState extends State<BookingCalendarView> {
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
        userName: '${user?.phoneNumber}',
        serviceName: 'Sports Booking',
        serviceDuration: 15,
        bookingEnd: DateTime(now.year, now.month, now.day, 22, 00),
        bookingStart: DateTime(now.year, now.month, now.day, 6, 30));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 3));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    if (kDebugMode) {
      print('${newBooking.toJson()} has been uploaded');
    }
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
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

  // String changeText(DateTime time) {
  //   String timeChange = time.toString();
  //   Text(timeChange) {
  //     const TextStyle(fontSize: 15);
  //   }

  //   return timeChange;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          automaticallyImplyLeading: true,
          title: const Text('Book a slot'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 85.0),
          child: Center(
            child: BookingCalendar(
              bookingService: sportBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
              hideBreakTime: true,
              loadingWidget: const Text('Fetching data...'),
              uploadingWidget:
                  const CircularProgressIndicator(color: Colors.purple),
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
              // formatDateTime: changeText(),
              // disabledDays: const [6, 7],
            ),
          ),
        ));
  }
}
