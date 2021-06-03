import 'package:json_annotation/json_annotation.dart';


part 'comment_reply_request.g.dart';

@JsonSerializable()
class CommentReplyRequest{

  @JsonKey(name: "review_comment_id")
  int reviewCommentId;
  @JsonKey(name: "role_id")
  int roleId;
  @JsonKey(name: "reply")
  String reply;

  CommentReplyRequest(this.reviewCommentId, this.roleId, this.reply);

  factory CommentReplyRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentReplyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentReplyRequestToJson(this);

}