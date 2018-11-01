import 'package:json_annotation/json_annotation.dart';
import 'package:myersplash_flutter/model/image_url.dart';
import 'package:myersplash_flutter/model/unsplash_user.dart';

part 'unsplash_image.g.dart';

@JsonSerializable()
class UnsplashImage {
  String url;
  String id;
  String color;
  UnsplashUser user;
  ImageUrl urls;

  bool fromUnsplash = true;

  UnsplashImage({this.url, this.fromUnsplash});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson` constructor.
  /// The constructor is named after the source class, in this case User.
  factory UnsplashImage.fromJson(Map<String, dynamic> json) =>
      _$UnsplashImageFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UnsplashImageToJson(this);
}
