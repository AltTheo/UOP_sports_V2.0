//Swim Page
import 'package:flutter/material.dart';
import '../../component/service_grid.dart';
import 'Instructions.dart';

class Swim extends StatefulWidget {
  static const String route = '/Bookings/Swim';
  const Swim({Key? key}) : super(key: key);

  @override
  State<Swim> createState() => SwimState();
}

class SwimState extends State<Swim> {
  final swimscrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Swimming, steam and Sauna'),
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
                  gridImage: Image.asset('lib/assets/images/man_swim.png',
                      height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                  onTap: () {},
                  gridtitle: 'Swim booking'),

              //SAUNA CARD
              Servicegrid(
                  gridImage: Image.asset('lib/assets/images/sauna.png',
                      height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Instructions()));
                  },
                  gridtitle: 'Steam & Sauna'),

              //UNDER 16 CARD
              Servicegrid(
                  gridImage: Image.asset('lib/assets/images/under_16.png',
                      height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                  onTap: () {},
                  gridtitle: 'Under 16 booking'),

              //SESSION HELP CARD
              Servicegrid(
                  gridImage: Image.asset('lib/assets/images/session_help.png',
                      height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                  onTap: () {},
                  gridtitle: 'Session help'),
            ]));
  }
}
