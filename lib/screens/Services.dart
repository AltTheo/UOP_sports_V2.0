import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/Services/ClimbServices/climb.dart';
import 'package:sport_test/Services/CourtServices/court.dart';
import 'package:sport_test/Services/PhysioServices/physio.dart';
import 'package:sport_test/Services/SwimServices/swim.dart';
import 'package:sport_test/screens/your_bookings.dart';
import '../Services/ClassServices/gymclass.dart';
import '../Services/GymServices/gym_sesh.dart';
import '../component/service_grid.dart';

class ServiceNavigatorRoutes {}

@immutable
class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => ServiceState();
}

class ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Services',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              CupertinoIcons.cart_fill,
            ),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => YourBookings()));
            },
          ),
        ],
      ),
      body: Center(
          child: GridView(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
              ),
              children: [
            // GYM CARD
            Servicegrid(
                gridImage: Image.asset('lib/assets/images/ravelin_gym.png',
                    height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Gymsesh()));
                },
                gridtitle: 'Gym'),

            //CLASSES CARD
            Servicegrid(
                gridImage: Image.asset('lib/assets/images/ravelin_class.png',
                    height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Gymclass()));
                },
                gridtitle: 'Classes'),

            //SWIM CARD
            Servicegrid(
                gridImage: Image.asset('lib/assets/images/ravelin_swim.png',
                    height: 110, width: 180, fit: BoxFit.fill),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Swim()));
                },
                gridtitle: 'Swim'),

            //CLIMB CARD
            Servicegrid(
                gridImage: Image.asset('lib/assets/images/ravelin_climb.png',
                    height: 110, gaplessPlayback: true, fit: BoxFit.fill),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Climb()));
                },
                gridtitle: 'Climb'),

            //COURT CARD
            Servicegrid(
                gridImage: Image.asset('lib/assets/images/court_2.png',
                    height: 110,
                    width: 185,
                    gaplessPlayback: true,
                    fit: BoxFit.fill),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Court()));
                },
                gridtitle: 'Courts'),

            //PHYSIO CARD
            Servicegrid(
                gridImage: Image.asset('lib/assets/images/physio_1.png',
                    height: 110,
                    width: 185,
                    gaplessPlayback: true,
                    fit: BoxFit.fill),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RavPhysio()));
                },
                gridtitle: 'Ravelin physio'),
          ])),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
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
