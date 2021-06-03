import 'package:json_annotation/json_annotation.dart';


part 'featured_post_list_request.g.dart';

@JsonSerializable()
class FeaturedPostRequest {

  @JsonKey(name: "city_id")
  String cityId;

  FeaturedPostRequest(this.cityId);

  factory FeaturedPostRequest.fromJson(Map<String, dynamic> json) =>
      _$FeaturedPostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedPostRequestToJson(this);

}