import 'package:json_annotation/json_annotation.dart';


part 'comment_like_request.g.dart';

@JsonSerializable()
class CommentLikeRequest{

  @JsonKey(name: "review_comment_id")
  int reviewCommentId;
  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "is_like")
  int isLike;

  CommentLikeRequest(this.reviewCommentId, this.roleId, this.isLike);

  factory CommentLikeRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentLikeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentLikeRequestToJson(this);

}