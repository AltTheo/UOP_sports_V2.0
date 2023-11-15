//Climbing Page
import 'package:flutter/material.dart';
import '../../component/service_grid.dart';

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
        body: GridView(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
            ),
            children: [
              // BOOKING CARD
              Servicegrid(
                  gridImage: Image.asset('lib/assets/images/racket.png',
                      height: 100,
                      width: 180,
                      gaplessPlayback: true,
                      fit: BoxFit.fill),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Discover()));
                  },
                  gridtitle: 'Racket Sports'),

              //SERVICES CARD
              Servicegrid(
                  gridImage: Image.asset('lib/assets/images/sport_2.png',
                      height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                  onTap: () {},
                  gridtitle: 'Sport bookings'),

              //RULES CARD
              Servicegrid(
                  gridImage: Image.asset('lib/assets/images/climb_1.png',
                      height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                  onTap: () {},
                  gridtitle: 'Booking help'),

              Servicegrid(
                  gridImage: Image.asset('lib/assets/images/climb_2.png',
                      height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                  onTap: () {},
                  gridtitle: 'Join a club'),
            ]));
  }
}

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
      ),
    );
  }
}
