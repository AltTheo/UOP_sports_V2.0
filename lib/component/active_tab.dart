import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class Activeitem extends StatelessWidget {
  final String title;
  final String url;
  final VoidCallback onTap;

  const Activeitem({
    super.key,
    required this.title,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        child: Row(children: [
          Card(
            color: Theme.of(context).colorScheme.primary,
            // shape: const RoundedRectangleBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(15)),
            // ),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.asset(
                      url,
                      width: 150,
                      height: 100,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 80,
          ),
          const SimpleCircularProgressBar(
              mergeMode: true,
              progressStrokeWidth: 15.0,
              animationDuration: 60,
              backStrokeWidth: 25.0,
              fullProgressColor: Colors.red,
              progressColors: [Colors.green, Colors.orange],
              size: 100,
              maxValue: 135)
        ]),
      ),
    );
  }
}
