import 'package:json_annotation/json_annotation.dart';

part 'image_url.g.dart';

@JsonSerializable()
class ImageUrl {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  ImageUrl();

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson` constructor.
  /// The constructor is named after the source class, in this case User.
  factory ImageUrl.fromJson(Map<String, dynamic> json) => _$ImageUrlFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}
