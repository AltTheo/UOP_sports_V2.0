import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:navbar_router/navbar_router.dart';

// class HomeScreen extends StatelessWidget {
//   static const String route = '/';
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         centerTitle: true,
//         backgroundColor: Colors.purple,
//       ),
//       drawer: const Drawer(
//         semanticLabel: 'Dashboard',
//       ),
//     );
//   }
// }

const Color mediumPurple = Color.fromRGBO(79, 0, 241, 1.0);
const String placeHolderText = 'Some news about sports from the university.';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    if (size.width < 600) {
      _addScrollListener();
    }
  }

  void handleScroll() {
    if (size.width > 600) return;
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (NavbarNotifier.isNavbarHidden) {
        NavbarNotifier.hideBottomNavBar = false;
      }
    } else {
      if (!NavbarNotifier.isNavbarHidden) {
        NavbarNotifier.hideBottomNavBar = true;
      }
    }
  }

  void _addScrollListener() {
    _scrollController.addListener(handleScroll);
  }

  Size size = Size.zero;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        // decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           fit: BoxFit.cover,
        //           image: AssetImage('lib/assets/images/white_3.png'))),
        child: ListView.builder(
          controller: _scrollController,
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
