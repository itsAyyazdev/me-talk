import 'package:json_annotation/json_annotation.dart';

part 'comment_request.g.dart';

@JsonSerializable()
class CommentRequest{

  @JsonKey(name: "review_id")
  String reviewId;
  @JsonKey(name: "review_type_id")
  String reviewTypeId;
  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "comment")
  String comment;

  CommentRequest(this.reviewId, this.reviewTypeId, this.roleId, this.comment);

  factory CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentRequestToJson(this);

}