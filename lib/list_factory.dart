import 'package:myersplash_flutter/list_service.dart';

class ListFactory {
  static const int CATEGORY_PHOTO = 0;
  static const int CATEGORY_HIGHLIGHTS = 1;
  static const int CATEGORY_SEARCH = 2;

  static ListService create(int category, String param) {
    switch (category) {
      case CATEGORY_PHOTO:
        return PhotoListService(param);
        break;
      case CATEGORY_HIGHLIGHTS:
        return HighlightsService();
        break;
      case CATEGORY_SEARCH:
        return SearchService(param);
        break;
      default:
        throw FormatException("Unknown category: $category");
        break;
    }
  }
}
