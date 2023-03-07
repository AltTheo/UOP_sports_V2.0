import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sport_test/auth/SignIn.dart';
import 'package:sport_test/auth/SignUp.dart';
import 'package:sport_test/redundant%20files/BookingScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class Physio extends StatefulWidget {
  const Physio({super.key});

  @override
  State<StatefulWidget> createState() => PhysioState();
}

class PhysioState extends State<Physio> {
  String placeText = '';

  Future<void> textData() async {
    final String physioText;
    const String path = 'lib/assets/text/physio.txt';
    physioText = await rootBundle.loadString(path);

    setState(() {
      placeText = physioText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    textData();
    return Scaffold(
      appBar: AppBar(title: const Text('South Coast Rx Physio')),
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
              child: Image.asset('lib/assets/images/physio.png',
                  height: 300, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10.0),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                child: Text(
                  placeText,
                  style: const TextStyle(fontSize: 17),
                )),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 40),
                      backgroundColor: Colors.purple),
                  onPressed: () async {
                    var url = Uri.parse(
                        "https://www.southcoastrxphysiotherapy.co.uk/");
                    await launchUrl(url);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.hourglass_tophalf_fill,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'South Coast Rx Physiotherapy',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
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
