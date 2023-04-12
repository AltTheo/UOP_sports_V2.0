import 'package:flutter/material.dart';

class Servicegrid extends StatelessWidget {
  final String gridtitle;
  final VoidCallback onTap;
  final Widget gridImage;
  final Color? backgroundColor;

  const Servicegrid(
      {super.key,
      required this.gridImage,
      required this.onTap,
      this.backgroundColor,
      required this.gridtitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: gridImage),
            const SizedBox(
              height: 8,
            ),
            Text(
              gridtitle,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
