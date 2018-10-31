// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashImage _$UnsplashImageFromJson(Map<String, dynamic> json) {
  return UnsplashImage(url: json['url'] as String)
    ..id = json['id'] as String
    ..color = json['color'] as String
    ..user = json['user'] == null
        ? null
        : UnsplashUser.fromJson(json['user'] as Map<String, dynamic>)
    ..urls = json['urls'] == null
        ? null
        : ImageUrl.fromJson(json['urls'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UnsplashImageToJson(UnsplashImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'color': instance.color,
      'user': instance.user,
      'urls': instance.urls
    };
