import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:sport_test/Services/ClimbServices/climb.dart';
import 'package:sport_test/Services/CourtServices/court.dart';
import 'package:sport_test/Services/GymServices/gymsesh.dart';
import 'package:sport_test/Services/PhysioServices/physio.dart';
import 'package:sport_test/Services/SwimServices/swim.dart';
import '../Services/ClassServices/gymclass.dart';

class ServiceNavigatorRoutes {
  static const String root = '/';
  static const String gym = '/gym';
  static const String classes = '/class';
  static const String swim = '/swim';
  static const String climb = '/climb';
}

@immutable
class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => ServiceState();
}

class ServiceState extends State<Service> {
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
          title: const Text('Services'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/white_3.png'))),
          child: Center(
              child: GridView(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                  ),
                  children: [
                // GYM CARD
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Gymsesh()));
                  },
                  child: Card(
                    color: Colors.purple,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset(
                              'lib/assets/images/ravelin_gym.png',
                              height: 110,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Gym',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),

                //CLASSES CARD
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Gymclass()));
                  },
                  child: Card(
                    color: Colors.purple,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset(
                              'lib/assets/images/ravelin_class.png',
                              height: 110,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Classes',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),

                //SWIM CARD
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Swim()));
                  },
                  child: Card(
                    color: Colors.purple,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset(
                              'lib/assets/images/ravelin_swim.png',
                              height: 110,
                              width: 180,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Swim',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),

                //CLIMB CARD
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Climb()));
                  },
                  child: Card(
                    color: Colors.purple,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset(
                              'lib/assets/images/ravelin_climb.png',
                              height: 110,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Climb',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),

                //CLIMB CARD
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Court()));
                  },
                  child: Card(
                    color: Colors.purple,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset('lib/assets/images/court_2.png',
                              height: 110,
                              width: 185,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Courts & Pitches',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RavPhysio()));
                  },
                  child: Card(
                    color: Colors.purple,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset('lib/assets/images/physio_1.png',
                              height: 110,
                              width: 185,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Ravelin physio',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              ])),
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
