import 'package:json_annotation/json_annotation.dart';

part 'like_request.g.dart';

@JsonSerializable()
class LikeRequest{

  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "review_type_id")
  String reviewTypeId;
  @JsonKey(name: "review_id")
  String reviewId;
  @JsonKey(name: "is_like")
  int isLike;

  LikeRequest(this.reviewId, this.reviewTypeId, this.roleId, this.isLike);

  factory LikeRequest.fromJson(Map<String, dynamic> json) =>
      _$LikeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LikeRequestToJson(this);

}