import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:navbar_router/navbar_router.dart';

@immutable
class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);
  static const String route = '/';

  // void _showAction(BuildContext context, int index) {
  //   showDialog<void>(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: Text(_actionTitles[index]),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(
  //                     builder: (context) => const BookingCalendarView())),
  //             child: const Text('Accept'),
  //           ),
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: const Text('Close'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final List<Map> activities =
        List.generate(4, (index) => {"id": index, "name": "Activity $index"})
            .toList();

    final List activityImages = [
      'lib/assets/images/gym_dumbbell.png',
      'lib/assets/images/classes_2.png',
      'lib/assets/images/swimming.png',
      'lib/assets/images/rock_climbing.png',
    ];

    final List activityTitles = [
      'Gym Session',
      'Gym classes',
      'Swimming',
      'Climbing'
    ];
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          backgroundColor: Colors.purple,
          title: const Text('Bookings'),
        ),
        body: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
            ),
            itemCount: activities.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  NavbarNotifier.hideBottomNavBar = false;
                  navigate(
                    context,
                    BookingCalendarView.route,
                    isRootNavigator: false,
                  ); // call click event
                },
                child: Card(
                  color: Colors.purple,
                  shadowColor: Colors.purpleAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        activityImages[index],
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        activityTitles[index],
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.purple,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
      ),
    );
  }
}

class BookingCalendarView extends StatefulWidget {
  static const String route = '/Bookings/calendarView';
  const BookingCalendarView({Key? key}) : super(key: key);

  @override
  State<BookingCalendarView> createState() => _BookingCalendarViewState();
}

class _BookingCalendarViewState extends State<BookingCalendarView> {
  final now = DateTime.now();
  late BookingService sportBookingService;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    sportBookingService = BookingService(
        // userEmail: ,
        // userId: ,
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

// String Function(DateTime){
//   Text formatted =
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
          bookingService: sportBookingService,
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          getBookingStream: getBookingStreamMock,
          uploadBooking: uploadBookingMock,
          hideBreakTime: false,
          loadingWidget: const Text('Fetching data...'),
          uploadingWidget: const CircularProgressIndicator(
            color: Colors.purple,
          ),
          startingDayOfWeek: StartingDayOfWeek.sunday,
          locale: "en",
          gridScrollPhysics:
              const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          availableSlotText: 'AVAILABLE',
          selectedSlotText: 'SELECTED',
          bookedSlotText: 'BOOKED',
          pauseSlotText: 'UNAVAILABLE',
          pauseSlotColor: Colors.grey,
          bookingGridCrossAxisCount: 4,
          bookingGridChildAspectRatio: 350 / 420,
          // formatDateTime: ,
          // disabledDays: const [6, 7],
        ),
      ),
    );
  }
}
