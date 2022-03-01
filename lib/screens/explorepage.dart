import 'package:flutter/material.dart';
import 'package:unsplash/models/topicsmodel.dart';
import 'package:unsplash/providers/get_images.dart';
import 'package:unsplash/widgets/topicsgrid.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final List<TopicsModel> topics = [];
  final GetImages image = GetImages();

  @override
  void initState() {
    super.initState();
    getTopics();
  }

  void getTopics() async {
    List<TopicsModel> topic = await image.getTopicsList();
    setState(() {
      for (var element in topic) {
        topics.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
            constraints: const BoxConstraints.expand(height: 100),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/explore.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Text(
                "Explore",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TopicsView(topics: topics)
        ]),
      ),
    );
  }
}
