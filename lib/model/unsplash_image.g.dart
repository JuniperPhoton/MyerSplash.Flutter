// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_image.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

UnsplashImage _$UnsplashImageFromJson(Map<String, dynamic> json) =>
    new UnsplashImage(
        json['id'] as String,
        json['urls'] == null
            ? null
            : new ImageUrl.fromJson(json['urls'] as Map<String, dynamic>),
        json['color'] as String);

abstract class _$UnsplashImageSerializerMixin {
  String get id;
  ImageUrl get urls;
  String get color;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'urls': urls, 'color': color};
}

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) => new ImageUrl(
    json['raw'] as String,
    json['full'] as String,
    json['small'] as String,
    json['regular'] as String,
    json['thumb'] as String);

abstract class _$ImageUrlSerializerMixin {
  String get raw;
  String get full;
  String get regular;
  String get small;
  String get thumb;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'raw': raw,
        'full': full,
        'regular': regular,
        'small': small,
        'thumb': thumb
      };
}
