import 'package:json_annotation/json_annotation.dart';

part 'featured_post_list_data.g.dart';

@JsonSerializable()
class FeaturedPostData{

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "event_id")
  int eventId;
  @JsonKey(name: "image_url")
  String imageUrl;

  FeaturedPostData(this.id, this.eventId, this.imageUrl);

  factory FeaturedPostData.fromJson(Map<String, dynamic> json) =>
      _$FeaturedPostDataFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedPostDataToJson(this);

}