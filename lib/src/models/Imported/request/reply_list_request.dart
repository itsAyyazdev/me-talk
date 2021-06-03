import 'package:json_annotation/json_annotation.dart';

part 'reply_list_request.g.dart';

@JsonSerializable()
class ReplyListRequest{

  @JsonKey(name: "review_comment_id")
  int reviewCommentId;
  @JsonKey(name: "role_id")
  int roleId;

  ReplyListRequest(this.reviewCommentId, this.roleId);

  factory ReplyListRequest.fromJson(Map<String, dynamic> json) =>
      _$ReplyListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyListRequestToJson(this);


}