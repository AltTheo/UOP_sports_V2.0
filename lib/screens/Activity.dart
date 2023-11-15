import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:sport_test/component/active_tab.dart';

class Activity extends StatelessWidget {
  Activity({super.key});

  final datetime = DateTime.now().toString();
  String cdate3 = DateFormat("MMMM, dd, yyyy").format(DateTime.now());
// output:  Aug, Fri, 2021
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Activity',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    cdate3,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    // color: Theme.of(context).colorScheme.primary,
                    child: DigitalClock(
                      areaHeight: 80,
                      areaWidth: 200,
                      hourMinuteDigitTextStyle: const TextStyle(
                        fontSize: 45,
                      ),
                      secondDigitTextStyle: const TextStyle(
                        fontSize: 30,
                      ),
                      // digitAnimationStyle:
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Activeitem(
                    title: 'Gym',
                    url: 'lib/assets/images/ravelin_gym.png',
                    onTap: () {}),
                Activeitem(
                    title: 'Climb',
                    url: 'lib/assets/images/ravelin_climb.png',
                    onTap: () {}),
                Activeitem(
                    title: 'Swim',
                    url: 'lib/assets/images/ravelin_swim.png',
                    onTap: () {}),
                Activeitem(
                    title: 'Sauna',
                    url: 'lib/assets/images/sauna.png',
                    onTap: () {})
              ],
            ),
          ),
        ));
  }
}
