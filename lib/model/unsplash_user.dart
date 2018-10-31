import 'package:json_annotation/json_annotation.dart';
import 'package:myersplash_flutter/model/profile_url.dart';

part 'unsplash_user.g.dart';

@JsonSerializable()
class UnsplashUser {
  String id;
  String userName;
  String name;
  ProfileUrl profileUrl;

  UnsplashUser();

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson` constructor.
  /// The constructor is named after the source class, in this case User.
  factory UnsplashUser.fromJson(Map<String, dynamic> json) => _$UnsplashUserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UnsplashUserToJson(this);
}