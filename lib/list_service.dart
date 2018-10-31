import 'package:intl/intl.dart';
import 'package:myersplash_flutter/model/unsplash_image.dart';

abstract class ListService {
  final _photosList = <UnsplashImage>[];
  int _page = 0;

  void populateList(int i) async {
    if (i >= _photosList.length) {
      populate();
    }
  }

  bool isEmpty() {
    return _photosList.isEmpty;
  }

  void populate();

  UnsplashImage get(int i);
}

class PhotoListService extends ListService {
  final String _path;

  PhotoListService(this._path);

  @override
  void populate() {
    // TODO: implement populate
  }

  @override
  UnsplashImage get(int i) {
    return null;
  }
}

class HighlightsService extends ListService {
  @override
  void populate() {
    final today = DateTime.now();

    for (int i = 0; i < 20; i++) {
      final current = today.subtract(Duration(days: _page * 20 + i));
      var formatter = new DateFormat('yyyyMMdd');
      String formatted = formatter.format(current);

      _photosList.add(UnsplashImage(
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

  SearchService(this._searchTerm);

  @override
  void populate() {
    // TODO: implement populate
  }

  @override
  UnsplashImage get(int i) {
    return null;
  }
}
