//Climbing Page
import 'package:flutter/material.dart';

class Court extends StatefulWidget {
  static const String route = '/Bookings/Climb';
  const Court({Key? key}) : super(key: key);

  @override
  State<Court> createState() => CourtState();
}

class CourtState extends State<Court> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Courts and pitches'),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/white_3.png'))),
          child: GridView(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
              ),
              children: [
                // BOOKING CARD
                InkWell(
                  onTap: () {},
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
                          child: Image.asset('lib/assets/images/racket.png',
                              height: 110,
                              width: 165,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Racket Sports',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),

                //SERVICES CARD
                InkWell(
                  onTap: () {},
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
                          child: Image.asset('lib/assets/images/sport_2.png',
                              height: 110,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Sport bookings',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),

                //RULES CARD
                InkWell(
                  onTap: () {},
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
                          child: Image.asset('lib/assets/images/climb_1.png',
                              height: 110, width: 180, fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Climbing \nEquipments',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {},
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
                          child: Image.asset('lib/assets/images/climb_2.png',
                              height: 110,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Under 16 \n bookings',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
