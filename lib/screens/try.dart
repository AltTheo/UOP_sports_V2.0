import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BookingCalendarDemoApp extends StatefulWidget {
  const BookingCalendarDemoApp({Key? key}) : super(key: key);

  @override
  State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
}

class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
  final now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Book a slot'),
      ),
      body: Center(
        child: BookingCalendar(
          bookingService: mockBookingService,
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          getBookingStream: getBookingStreamMock,
          uploadBooking: uploadBookingMock,
          hideBreakTime: true,
          loadingWidget: const Text('Fetching data...'),
          uploadingWidget: const CircularProgressIndicator(
            color: Colors.purple,
          ),
          startingDayOfWeek: StartingDayOfWeek.sunday,
          // disabledDays: const [6, 7],
        ),
      ),
    );
  }
}
