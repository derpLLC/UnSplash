import 'package:flutter/material.dart';
import 'package:unsplash/models/imagemodel.dart';
import 'package:unsplash/utils/pref_manager.dart';
import 'package:unsplash/widgets/photosgrid.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    getImageModels();
    super.initState();
  }

  ScrollController scrolls = ScrollController();
  List<ImageModel> myImages = [];
  PrefManager prefs = PrefManager();

  Future<void> getImageModels() async {
    final favorites = await prefs.getFavoriteList();
    if (favorites.isNotEmpty) {
      for (var url in favorites) {
        final imagedata = {
          "id": "",
          "urls": {
            "small": "",
            "raw": "",
            "regular": url,
            "thumb": "",
            "full": ""
          }
        };
        setState(() {
          myImages.add(ImageModel.fromJson(imagedata));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: myImages.isEmpty
            ? const NoFavoritePage()
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                    constraints: const BoxConstraints.expand(height: 50),
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "Favorites",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    )),
                  ),
                  Expanded(
                    child: PhotosView(
                      images: myImages,
                      scrollController: scrolls,
                      isNormalGrid: true,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class NoFavoritePage extends StatelessWidget {
  const NoFavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/heart.png",
            height: 80,
            width: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "You have no favorites yet.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
