import 'package:flutter/material.dart';

const Color mediumPurple = Color.fromRGBO(79, 0, 241, 1.0);
const String placeHolderText = 'Some news about sports from the university.';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 11,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (contex) => FeedDetail(
                            feedId: index.toString(),
                          )));
                },
                child: FeedTile(
                  index: index,
                ));
          },
        ),
      ),
    );
  }
}

class FeedTile extends StatelessWidget {
  final int index;
  const FeedTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      color: Colors.white54.withOpacity(0.4),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 4,
            left: 4,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              height: 180,
              alignment: Alignment.center,
              child: Text('Feed $index card'),
            ),
          ),
          Positioned(
              bottom: 12,
              right: 12,
              left: 12,
              child: Text(placeHolderText.substring(
                0,
              )))
        ],
      ),
    );
  }
}

class FeedDetail extends StatelessWidget {
  final String feedId;
  const FeedDetail({Key? key, this.feedId = '1'}) : super(key: key);
  static const String route = '/feeds/detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed $feedId'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: 300,
              ),
              Text(placeHolderText),
            ],
          ),
        ),
      ),
    );
  }
}
