// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) {
  return ImageUrl()
    ..raw = json['raw'] as String
    ..full = json['full'] as String
    ..regular = json['regular'] as String
    ..small = json['small'] as String
    ..thumb = json['thumb'] as String;
}

Map<String, dynamic> _$ImageUrlToJson(ImageUrl instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb
    };
