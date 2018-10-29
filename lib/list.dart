import 'package:flutter/material.dart';
import 'package:myersplash_flutter/model/unsplash_image.dart';
import 'package:intl/intl.dart';

typedef void OnTapPhoto(UnsplashImage image);

class PhotoList extends StatefulWidget {
  OnTapPhoto onTap;

  PhotoList({@required this.onTap});

  @override
  State<StatefulWidget> createState() => _listState(onTapPhoto: onTap);
}

class _listState extends State<PhotoList> {
  final _photosList = <UnsplashImage>[];
  final OnTapPhoto onTapPhoto;

  _listState({@required this.onTapPhoto});

  int _page = 0;

  void _populateList() {
    final today = DateTime.now();

    for (int i = 0; i < 20; i++) {
      final current = today.subtract(Duration(days: _page * 20 + i));
      var formatter = new DateFormat('yyyyMMdd');
      String formatted = formatter.format(current);

      _photosList.add(UnsplashImage(
          url:
              "https://juniperphoton.net/myersplash/wallpapers/thumbs/$formatted.jpg"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      if (i >= _photosList.length) {
        _populateList();
      }
      return InkWell(
        onTap: () {
          onTapPhoto(_photosList[i]);
        },
        child: AspectRatio(
          child: Image.network(
            _photosList[i].url,
            fit: BoxFit.cover,
          ),
          aspectRatio: 3 / 2.0,
        ),
      );
    });
  }
}
