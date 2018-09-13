import 'package:json_annotation/json_annotation.dart';

part 'unsplash_image.g.dart';

@JsonSerializable()
class UnsplashImage extends Object with _$UnsplashImageSerializerMixin {
  String id;
  ImageUrl urls;
  String color;

  UnsplashImage(this.id, this.urls, this.color);

  factory UnsplashImage.fromJson(Map<String, dynamic> json) =>
      _$UnsplashImageFromJson(json);
}

@JsonSerializable()
class ImageUrl extends Object with _$ImageUrlSerializerMixin {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  ImageUrl(this.raw, this.full, this.small, this.regular, this.thumb);

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlFromJson(json);
}