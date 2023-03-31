//Gym session page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/component/ServiceGrid.dart';

import '../../src/BookingCalendar.dart';
import 'GymBookingCalendar.dart';

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
            appBar: AppBar(
              title: const Text('Gym Session'),
            ),
            body: Container(
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage('lib/assets/images/white_3.png'))),
              child: GridView(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                  ),
                  children: [
                    // BOOKING CARD
                    Servicegrid(
                        gridImage: Image.asset(
                            'lib/assets/images/gym_lifting.png',
                            height: 110,
                            gaplessPlayback: true,
                            fit: BoxFit.fill),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const GymBookingCalendarView()));
                          // var url = Uri.parse(
                          //     "https://uniofportsmouth.leisurecloud.net/Connect/mrmResourceStatus.aspx");
                          // await launchUrl(url);
                        },
                        gridtitle: 'Gym booking'),

                    //CLASSES CARD
                    Servicegrid(
                        gridImage: Image.asset(
                            'lib/assets/images/Gym_booking.png',
                            height: 110,
                            gaplessPlayback: true,
                            fit: BoxFit.fill),
                        onTap: () {},
                        gridtitle: 'Gym classes'),

                    //RULES CARD
                    Servicegrid(
                        gridImage: Image.asset(
                            'lib/assets/images/gym_services.png',
                            height: 110,
                            gaplessPlayback: true,
                            fit: BoxFit.fill),
                        onTap: () {},
                        gridtitle: 'Gym rules')

                    // InkWell(
                    //   onTap: () {},
                    //   child: Card(
                    //     color: Colors.purple,
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(15)),
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         ClipRRect(
                    //           borderRadius: const BorderRadius.only(
                    //           topLeft: Radius.circular(15),
                    //           topRight: Radius.circular(15)),
                    //           child: Image.asset('lib/assets/images/ravelin_climb.png',
                    //               height: 110,
                    //               gaplessPlayback: true,
                    //               fit: BoxFit.fill),
                    //         ),
                    //         const SizedBox(
                    //           height: 10,
                    //         ),
                    //         const Text(
                    //           'Climb',
                    //           style: TextStyle(
                    //               fontSize: 20,
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.normal),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ]),
            ));
  }
}
