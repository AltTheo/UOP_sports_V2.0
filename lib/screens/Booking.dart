import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:navbar_router/navbar_router.dart';

@immutable
class Booking extends StatefulWidget {
  static const String route = '/';
  const Booking({super.key});

  @override
  State<Booking> createState() => BookingState();
}

class BookingState extends State<Booking> {
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

  final _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    if (size.width < 600) {
      _addScrollListener();
    }
  }

  void handleScroll() {
    if (size.width > 600) return;
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (NavbarNotifier.isNavbarHidden) {
        NavbarNotifier.hideBottomNavBar = false;
      }
    } else {
      if (!NavbarNotifier.isNavbarHidden) {
        NavbarNotifier.hideBottomNavBar = true;
      }
    }
  }

  void _addScrollListener() {
    _scrollController.addListener(handleScroll);
  }

  Size size = Size.zero;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List activityImages = [
    //   'lib/assets/images/gym_dumbbell.png',
    //   'lib/assets/images/classes_2.png',
    //   'lib/assets/images/swimming.png',
    //   'lib/assets/images/rock_climbing.png',
    // ];

    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          backgroundColor: Colors.purple,
          title: const Text('Bookings'),
        ),
        body: Center(
            child: GridView(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                ),
                children: [
              InkWell(
                onTap: () {
                  navigate(
                    context,
                    Gymsesh.route,
                    isRootNavigator: false,
                  );
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.purpleAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  color: Colors.purple,
                  elevation: 20,
                  borderOnForeground: true,
                  surfaceTintColor: Colors.purpleAccent,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/gym_dumbbell.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Gym Session',
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.overline,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  navigate(
                    context,
                    Gymclass.route,
                    isRootNavigator: false,
                  );
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.purpleAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  color: Colors.purple,
                  elevation: 20,
                  borderOnForeground: true,
                  surfaceTintColor: Colors.purpleAccent,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/classes_2.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Gym Classes',
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.overline,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  navigate(
                    context,
                    Swim.route,
                    isRootNavigator: false,
                  );
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.purpleAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  color: Colors.purple,
                  elevation: 20,
                  borderOnForeground: true,
                  surfaceTintColor: Colors.purpleAccent,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/swimming.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Swimming',
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.overline,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  navigate(
                    context,
                    Climb.route,
                    isRootNavigator: false,
                  );
                },
                child: Card(
                  color: Colors.purple,
                  elevation: 20,
                  borderOnForeground: true,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.purpleAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  surfaceTintColor: Colors.purpleAccent,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/rock_climbing.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Climbing',
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.overline,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ])));
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

class Gymsesh extends StatefulWidget {
  static const String route = '/Bookings/Gymsesh';
  const Gymsesh({Key? key}) : super(key: key);

  @override
  State<Gymsesh> createState() => GymseshState();
}

class GymseshState extends State<Gymsesh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Gym Session')),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Row(
                  children: const [
                    Icon(CupertinoIcons.location_solid),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sports & Recreation',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    )
                  ],
                ),
              ])
            ],
          ),
        ));
  }
}






class Gymclass extends StatefulWidget {
  static const String route = '/Bookings/Gymclass';
  const Gymclass({Key? key}) : super(key: key);

  @override
  State<Gymclass> createState() => GymclassState();
}

class GymclassState extends State<Gymclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Gym classes')),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Row(
                  children: const [
                    Icon(CupertinoIcons.location_solid),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sports & Recreation',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    )
                  ],
                ),
              ])
            ],
          ),
        ));
  }
}




class Climb extends StatefulWidget {
  static const String route = '/Bookings/Climb';
  const Climb({Key? key}) : super(key: key);

  @override
  State<Climb> createState() => ClimbState();
}

class ClimbState extends State<Climb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Climbing')),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Row(
                  children: const [
                    Icon(CupertinoIcons.location_solid),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sports & Recreation',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    )
                  ],
                ),
              ])
            ],
          ),
        ));
  }
}




class Swim extends StatefulWidget {
  static const String route = '/Bookings/Swim';
  const Swim({Key? key}) : super(key: key);

  @override
  State<Swim> createState() => SwimState();
}

class SwimState extends State<Swim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Swimming')),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Row(
                  children: const [
                    Icon(CupertinoIcons.location_solid),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sports & Recreation',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    )
                  ],
                ),
              ])
            ],
          ),
        ));
  }
}

class BookingCalendarView extends StatefulWidget {
  static const String route = '/Bookings/Gymsesh/calendarView';
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
          pauseSlotColor: Colors.grey,
          bookingGridCrossAxisCount: 4,
          bookingGridChildAspectRatio: 350 / 420,
          // formatDateTime: changeText(),
          // disabledDays: const [6, 7],
        ),
      ),
    );
  }
}