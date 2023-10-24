import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _navigateToDetailScreen(DocumentSnapshot document) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FeedDetail(feedId: document.id),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("What's On?"),
      ),
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: firestore
              .collection('News')
              .orderBy('priority', descending: false)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                  body: Center(child: Text('Error: ${snapshot.error}')));
            }

            if (!snapshot.hasData) {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }

            final documents = snapshot.data!.docs;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final document = documents[index];

                return InkWell(
                  onTap: () => _navigateToDetailScreen(
                      document), // modified to call _navigateToDetailScreen method
                  child: FeedTile(snapshot: document),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class FeedTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  const FeedTile({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    // Access the fields from your document data:
    final title = data['title'] as String?;
    final url = data['imageUrl'] as String?;
    final image = (url != null)
        ? ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image(
              image: NetworkImage(url),
              height: 500,
              width: 1000,
              fit: BoxFit.cover,
            ),
          )
        : const Placeholder();

    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      color: Colors.white38.withOpacity(0.4),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 4,
            left: 4,
            child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('lib/assets/images/white_3.png'))),
                height: 210,
                alignment: Alignment.center,
                child: Container(child: image)),
          ),
          Positioned(
            bottom: 8,
            right: 12,
            left: 12,
            child: Text(
              title ?? 'No title available.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedDetail extends StatelessWidget {
  final String feedId;

  const FeedDetail({Key? key, required this.feedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('News').doc(feedId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.requireData.data() as Map<String, dynamic>;
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image(
                      image: NetworkImage(data['imageUrl'] ?? ''),
                      height: 250,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Container(
                  //   height: 250,
                  //   decoration: BoxDecoration(
                  //     color: const Color.fromARGB(255, 54, 3, 65),
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //       image: NetworkImage(data['imageUrl'] ?? ''),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    data['title'] ?? 'No title available',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    data['description'] ?? 'No description available',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
