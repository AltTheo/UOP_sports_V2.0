import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class RavPhysio extends StatefulWidget {
  const RavPhysio({super.key});

  @override
  State<StatefulWidget> createState() => RavPhysioState();
}

class RavPhysioState extends State<RavPhysio> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset('lib/assets/images/physio.png',
                height: 250, width: 450, fit: BoxFit.cover),
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
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(340, 40),
                ),
                onPressed: () async {
                  var url =
                      Uri.parse("https://www.southcoastrxphysiotherapy.co.uk/");
                  await launchUrl(url);
                },
                child: Row(
                  children: const [
                    Icon(
                      CupertinoIcons.hourglass_tophalf_fill,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'South Coast Rx Physiotherapy',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
