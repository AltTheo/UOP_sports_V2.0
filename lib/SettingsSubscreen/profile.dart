import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;

  late final String? photosrc = user.photoURL;

  String src =
      'https://lh3.googleusercontent.com/a/AEdFTp7W1SXYppsLgrKV64IpYCDddjB1c7HBUtiXdcJemg=s96-c';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Info'),
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/white_3.png'))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(child: Image.network(src, scale: 0.7)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Member Account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${user.displayName}',
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${user.email}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(220, 40),
                              backgroundColor: Colors.purple),
                          onPressed: () async {
                            var url = Uri.parse(
                                "https://uniofportsmouth.leisurecloud.net/Connect/mrmResourceStatus.aspx");
                            await launchUrl(url);
                          },
                          child: Row(
                            children: const [
                              Icon(
                                CupertinoIcons.pencil_ellipsis_rectangle,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Manage Membership',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
