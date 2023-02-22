import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/SignUp.dart';
import 'package:sport_test/redundant%20files/BookingScreen.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Steam & Sauna')),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/images/white_3.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.asset('lib/assets/images/sauna.png',
                  height: 300, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: Text(
                'Please shower before and after using the steam room / sauna. \nDo not exceed 15 minutes in either room ',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Text(
                'Use the emergency panic alarm in the event of an emergency, or speak to a lifeguard if you feel unwell.',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Text(
                'Appropriate swimwear must be worn at all times',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(190, 40)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BookingCalendarView()));
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.timer_sharp),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Pick your time',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
