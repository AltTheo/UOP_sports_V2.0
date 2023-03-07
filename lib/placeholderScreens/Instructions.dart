import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/SignUp.dart';
import 'package:sport_test/redundant%20files/BookingScreen.dart';

class Instructions extends StatefulWidget {
  const Instructions({super.key});
  @override
  State<StatefulWidget> createState() => InstructionsState();
}

class InstructionsState extends State<Instructions> {
  String placeText = '';

  Future<void> textData() async {
    final String saunaText;
    const String path = 'lib/assets/text/sauna.txt';
    saunaText = await rootBundle.loadString(path);

    setState(() {
      placeText = saunaText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    textData();
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: Text(
                placeText,
                style: const TextStyle(fontSize: 17.0),
              ),
            ),
            const SizedBox(
              height: 3.0,
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
