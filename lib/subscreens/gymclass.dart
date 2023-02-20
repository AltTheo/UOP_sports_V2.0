//Gym Class Page
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: const Text('Classes'),
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
                          child: Image.asset('lib/assets/images/classes_3.png',
                              height: 110,
                              width: 170,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Class booking',
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
                          child: Image.asset(
                              'lib/assets/images/aquaclass_2.png',
                              height: 110,
                              width: 170,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Aqua classes',
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
                          child: Image.asset('lib/assets/images/classes_4.png',
                              height: 110,
                              gaplessPlayback: true,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Class rules',
                          style: TextStyle(
                              fontSize: 18,
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
                          child: Image.asset('lib/assets/images/classes_5.png',
                              height: 110, width: 180, fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'UoP fitness',
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
