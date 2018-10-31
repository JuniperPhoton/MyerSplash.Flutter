// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUrl _$ProfileUrlFromJson(Map<String, dynamic> json) {
  return ProfileUrl()
    ..self = json['self'] as String
    ..html = json['html'] as String
    ..photos = json['photos'] as String
    ..likes = json['likes'] as String
    ..portfolio = json['portfolio'] as String;
}

Map<String, dynamic> _$ProfileUrlToJson(ProfileUrl instance) =>
    <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'photos': instance.photos,
      'likes': instance.likes,
      'portfolio': instance.portfolio
    };
