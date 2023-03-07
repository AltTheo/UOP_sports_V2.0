//Swim Page
import 'package:flutter/material.dart';
import 'package:sport_test/placeholderScreens/Instructions.dart';

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
                          child: Image.asset('lib/assets/images/man_swim.png',
                              height: 110,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Swim booking',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),

                //SERVICES CARD
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Instructions()));
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
                          child: Image.asset('lib/assets/images/sauna.png',
                              height: 110,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Steam & Sauna',
                          style: TextStyle(fontSize: 18, color: Colors.white),
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
                          child: Image.asset('lib/assets/images/under_16.png',
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
                          child: Image.asset(
                              'lib/assets/images/session_help.png',
                              height: 110,
                              width: 180,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Session help',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
