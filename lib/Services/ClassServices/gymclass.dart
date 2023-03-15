//Gym Class Page
import 'package:flutter/material.dart';
import 'package:sport_test/component/ServiceGrid.dart';

class Gymclass extends StatefulWidget {
  const Gymclass({Key? key}) : super(key: key);

  static const String route = '/Bookings/Gymclass';

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
                // class booking CARD
                Servicegrid(
                    gridImage: Image.asset('lib/assets/images/classes_3.png',
                        height: 110,
                        width: 170,
                        gaplessPlayback: true,
                        fit: BoxFit.fill),
                    onTap: () {},
                    gridtitle: 'Class booking'),

                //AQUA CLASSES CARD
                Servicegrid(
                  gridImage: Image.asset('lib/assets/images/aquaclass_2.png',
                      height: 110,
                      width: 170,
                      gaplessPlayback: true,
                      fit: BoxFit.fill),
                  gridtitle: 'Aqua classes',
                  onTap: () {},
                ),

                //CLASS RULES
                Servicegrid(
                  gridImage: Image.asset('lib/assets/images/classes_4.png',
                      height: 110,
                      width: 170,
                      gaplessPlayback: true,
                      fit: BoxFit.fill),
                  gridtitle: 'Class rules',
                  onTap: () {},
                ),

                //UOP FITNESS CARD
                Servicegrid(
                  gridImage: Image.asset('lib/assets/images/classes_5.png',
                      height: 110,
                      width: 170,
                      gaplessPlayback: true,
                      fit: BoxFit.fill),
                  gridtitle: 'UoP Fitness',
                  onTap: () {},
                ),
              ]),
        ));
  }
}
