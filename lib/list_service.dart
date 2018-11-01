import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:myersplash_flutter/model/unsplash_image.dart';
import 'package:myersplash_flutter/request.dart';
import 'package:http/http.dart' as http;

abstract class ListService {
  final _photosList = <UnsplashImage>[];
  int _page = 0;

  Future populateList(int i) async {
    if (i >= _photosList.length) {
      await populate();
    }
  }

  Future refresh() async {
    _page = 1;
  }

  bool isEmpty() {
    return _photosList.isEmpty;
  }

  Future populate();

  UnsplashImage get(int i);
}

class PhotoListService extends ListService {
  final String _path;

  PhotoListService(this._path) {
    _page = 1;
  }

  @override
  Future populate() async {
    var url = "${Request.BASE_URl}${_path}client_id=${Request.CLIENT_ID}";
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        var list = json.decode(response.body) as List;
        List<UnsplashImage> posts = list.map((f){
          return UnsplashImage.fromJson(f);
        }).toList();
        _photosList.addAll(posts);
        _page++;
      }
    });
  }

  @override
  UnsplashImage get(int i) {
    return null;
  }
}

class HighlightsService extends ListService {
  @override
  Future populate() async {
    final today = DateTime.now();

    for (int i = 0; i < 20; i++) {
      final current = today.subtract(Duration(days: _page * 20 + i));
      var formatter = new DateFormat('yyyyMMdd');
      String formatted = formatter.format(current);

      _photosList.add(UnsplashImage(
          fromUnsplash: false,
          url:
              "https://juniperphoton.net/myersplash/wallpapers/thumbs/$formatted.jpg"));
    }

    _page++;
  }

  @override
  UnsplashImage get(int i) {
    return _photosList[i];
  }
}

class SearchService extends ListService {
  final String _searchTerm;

  SearchService(this._searchTerm) {
    _page = 1;
  }

  @override
  Future populate() {}

  @override
  UnsplashImage get(int i) {
    return null;
  }
}
