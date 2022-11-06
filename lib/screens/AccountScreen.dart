import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Account'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sign out',
                        style: TextStyle(color: Colors.red, fontSize: 20.0),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
