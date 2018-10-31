// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashUser _$UnsplashUserFromJson(Map<String, dynamic> json) {
  return UnsplashUser()
    ..id = json['id'] as String
    ..userName = json['userName'] as String
    ..name = json['name'] as String
    ..profileUrl = json['profileUrl'] == null
        ? null
        : ProfileUrl.fromJson(json['profileUrl'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UnsplashUserToJson(UnsplashUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'name': instance.name,
      'profileUrl': instance.profileUrl
    };
