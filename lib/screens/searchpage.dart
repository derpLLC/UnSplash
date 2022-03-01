import 'package:flutter/material.dart';
import 'package:unsplash/models/imagemodel.dart';
import 'package:unsplash/providers/get_images.dart';
import 'package:unsplash/widgets/photosgrid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    getImages(widget.query);
    scrolls.addListener(() {
      if (scrolls.position.pixels == scrolls.position.maxScrollExtent) {
        getImages(widget.query);
      }
    });
    super.initState();
  }

  List<ImageModel> myImages = [];

  getImages(query) async {
    List<ImageModel> images = await image.searchImage(query: query);
    setState(() {
      for (var element in images) {
        myImages.add(element);
      }
    });
  }

  GetImages image = GetImages();
  ScrollController scrolls = ScrollController();

  @override
  Widget build(BuildContext context) {
    return PhotosView(
        images: myImages, scrollController: scrolls, isNormalGrid: false);
  }
}
