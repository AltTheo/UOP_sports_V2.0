//Climbing Page
import 'package:flutter/material.dart';
import '../../component/service_grid.dart';

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
        appBar: AppBar(
          title: const Text('Climbing'),
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
                Servicegrid(
                    gridImage: Image.asset('lib/assets/images/climb_girl.png',
                        height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                    onTap: () {},
                    gridtitle: 'Climb booking'),

                //SERVICES CARD
                Servicegrid(
                    gridImage: Image.asset('lib/assets/images/climb_3.png',
                        height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                    onTap: () {},
                    gridtitle: 'Session help'),

                //RULES CARD
                Servicegrid(
                    gridImage: Image.asset('lib/assets/images/climb_1.png',
                        height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                    onTap: () {},
                    gridtitle: 'Climbing\nequipments'),

                Servicegrid(
                    gridImage: Image.asset('lib/assets/images/climb_2.png',
                        height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                    onTap: () {},
                    gridtitle: 'Under 16\nbookings'),
              ]),
        ));
  }
}
